import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mynewapp/common_resources.dart';
import 'package:mynewapp/favourite/favourite_screen.dart';
import 'package:mynewapp/fixtures/fixtures.dart';
import 'package:mynewapp/home/home_screen.dart';
import 'package:mynewapp/images_assets.dart';
import 'package:mynewapp/news/news_screen.dart';
import 'package:mynewapp/setting/setting.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({
    super.key,
    required this.label,
    required this.body,
    this.appBar,
    this.haveNavigationButtons = true,
    this.hasBasicAppbar = false,
    this.backgroundColor,
  });
  final String label;
  final Widget body;
  final PreferredSizeWidget? appBar;
  final bool haveNavigationButtons;
  final bool hasBasicAppbar;
  final Color? backgroundColor;

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      appBar: (widget.hasBasicAppbar == true)
          ? AppBar(
              title: safeText(
                text: widget.label,
                color: Colors.white,
              ),
              backgroundColor: commonColor(),
            )
          : widget.appBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: (widget.haveNavigationButtons == true)
          ? Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: const BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  navigationButton(
                    'Tổng hợp',
                    ImagesAssets.collection,
                    const Home(),
                  ),
                  navigationButton(
                    'Tin tức',
                    ImagesAssets.news,
                    const NewsScreen(),
                  ),
                  navigationButton(
                    'Lịch đấu',
                    ImagesAssets.cup,
                    const Fixtures(),
                  ),
                  navigationButton(
                    'Theo dõi',
                    ImagesAssets.following,
                    const Favourite(),
                  ),
                  navigationButton(
                    'Cài đặt',
                    ImagesAssets.menu,
                    const Setting(),
                  ),
                ],
              ),
            )
          : null,
      body: widget.body,
    );
  }

  Widget navigationButton(
    String title,
    String imageAddress,
    Widget targetPage,
  ) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {
          Get.off(targetPage);
        },
        child: Container(
          height: 70.h,
          foregroundDecoration: (title == widget.label)
              ? null
              : BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Visibility(
                  visible: title == widget.label,
                  child: Container(
                    color: Colors.lightBlue,
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 30.h,
                        width: 30.w,
                        child: Image.asset(
                          imageAddress,
                          fit: BoxFit.fill,
                          color: Color.alphaBlend(Colors.black.withOpacity(0.5),
                              Colors.purple.shade700),
                        )),
                    Text(
                      title,
                      style: TextStyle(
                        color: Color.alphaBlend(Colors.black.withOpacity(0.5),
                            Colors.purple.shade700),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
