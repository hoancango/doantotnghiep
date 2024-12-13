import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mynewapp/common_resources.dart';
import 'package:mynewapp/home/home_controller.dart';
import 'package:mynewapp/home/home_screen.dart';
import 'package:mynewapp/images_assets.dart';
import 'package:mynewapp/welcome/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  RxBool isReady = false.obs;

  @override
  void didChangeDependencies() {
    preLoadAssets();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    pagesNavigation();
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Obx(
        () => (isReady.value == false)
            ? Container(
                color: Colors.black,
              )
            : Stack(children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                          height: height,
                          child: Image.asset(
                            ImagesAssets.green,
                            fit: BoxFit.fill,
                          )),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    height: 120,
                    width: 50,
                    color: Colors.grey.shade300,
                  ),
                ),
                Center(
                    child: SizedBox(
                        height: 230,
                        width: 230,
                        child: Image.asset(
                          ImagesAssets.pl,
                          fit: BoxFit.fill,
                        ))),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: safeText(
                        text: '${'Loading'.tr} ...',
                        color: commonColor(),
                        fontSize: 30.sp,
                        isBold: true,
                      ),
                    )),
              ]),
      ),
    );
  }

  Future<void> pagesNavigation() async {
    final startTime = DateTime.now();
    String? favTeam;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Future<void> addAwaitingDuration() async {
      final elapsedTime = DateTime.now().difference(startTime).inMilliseconds;
      const minDuration = 2500;
      if (elapsedTime < minDuration) {
        await Future.delayed(Duration(milliseconds: minDuration - elapsedTime));
      }
    }

    favTeam = prefs.getString('teamNewsChoice');
    if (favTeam != null) {
      final homeController = Get.put(
        HomeController(),
        permanent: true,
      );
      await addAwaitingDuration();
      Get.off(const Home());

    } else {
      await addAwaitingDuration();
      Get.off(const Welcome());
    }
  }

  Future<void> preLoadAssets() async {
    isReady.value = false;
    await Future.wait(
      [
        precacheImage(AssetImage(ImagesAssets.green), context),
        precacheImage(AssetImage(ImagesAssets.pl), context),
      ],
    );
    isReady.value = true;
  }
}
