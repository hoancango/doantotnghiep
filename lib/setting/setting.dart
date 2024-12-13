import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mynewapp/base_screen.dart';
import 'package:mynewapp/common_resources.dart';
import 'package:mynewapp/home/home_controller.dart';
import 'package:mynewapp/news/news_controller.dart';
import 'package:mynewapp/setting/setting_controller.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  late SettingController _controller;

  @override
  void initState() {
    _controller = Get.put(SettingController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(
        title: safeText(text: 'Setting'.tr, color: Colors.white),
        backgroundColor: commonColor(),
      ),
      label: 'Setting'.tr,
      body: Obx(() {
        (_controller.welcomeController.isLoading.value)
            ? context.loaderOverlay.show()
            : context.loaderOverlay.hide();

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Get.dialog(Obx(
                      () => AlertDialog(
                        title: safeText(text: 'Theme mode'.tr),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                _controller.isDarkMode.value = null;
                                Get.changeThemeMode(ThemeMode.system);
                                print(Get.theme);

                                await _controller.saveSelectedTheme(
                                    isDarkTheme: _controller.isDarkMode.value);
                                Get.back();
                              },
                              child: SizedBox(
                                height: 30.h,
                                width: 200.w,
                                child: Center(
                                  child: safeText(
                                      text: 'Default'.tr,
                                      color:
                                          (_controller.isDarkMode.value != null)
                                              ? null
                                              : Colors.lightBlue),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () async {
                                _controller.isDarkMode.value = false;
                                Get.changeTheme(ThemeData.light());
                                Get.changeThemeMode(ThemeMode.light);
                                await _controller.saveSelectedTheme(
                                    isDarkTheme: _controller.isDarkMode.value);
                                Get.back();
                              },
                              child: SizedBox(
                                height: 30.h,
                                width: 200.w,
                                child: Center(
                                  child: safeText(
                                      text: 'Light'.tr,
                                      color: (_controller.isDarkMode.value ==
                                              false)
                                          ? Colors.lightBlue
                                          : null),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () async {
                                _controller.isDarkMode.value = true;
                                Get.changeTheme(ThemeData.dark());
                                Get.changeThemeMode(ThemeMode.dark);
                                print(Get.theme);

                                await _controller.saveSelectedTheme(
                                    isDarkTheme: _controller.isDarkMode.value);
                                Get.back();
                              },
                              child: SizedBox(
                                height: 30.h,
                                width: 200.w,
                                child: Center(
                                  child: safeText(
                                      text: 'Dark'.tr,
                                      color:
                                          (_controller.isDarkMode.value == true)
                                              ? Colors.lightBlue
                                              : null),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
                  },
                  child: Container(
                    height: 50.h,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Icon(Icons.light_mode),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              safeText(text: 'Theme mode'.tr, fontSize: 17.sp),
                              safeText(
                                  text: (_controller.isDarkMode.value != null)
                                      ? (_controller.isDarkMode.value == true)
                                          ? 'Dark'.tr
                                          : 'Light'.tr
                                      : 'Default'.tr),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Get.dialog(Obx(
                      () => AlertDialog(
                        title: safeText(
                            text: 'Interface language'.tr, fontSize: 17.sp),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () async {
                                Get.updateLocale(const Locale('vi', 'VN'));

                                await _controller
                                    .saveSelectedLanguage('Tiếng Việt');

                                Get.back();
                              },
                              child: SizedBox(
                                height: 30.h,
                                width: 300.w,
                                child: Center(
                                  child: safeText(
                                      text: 'Tiếng Việt',
                                      color:
                                          (_controller.selectedLanguage.value ==
                                                  'Tiếng Việt')
                                              ? Colors.lightBlue
                                              : null),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () async {
                                Get.updateLocale(const Locale('en', 'GB'));

                                await _controller
                                    .saveSelectedLanguage('English');

                                Get.back();
                              },
                              child: SizedBox(
                                height: 30.h,
                                width: 300.w,
                                child: Center(
                                  child: safeText(
                                      text: 'English',
                                      color:
                                          (_controller.selectedLanguage.value ==
                                                  'English')
                                              ? Colors.lightBlue
                                              : null),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
                  },
                  child: Container(
                    height: 50.h,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Icon(Icons.language),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              safeText(
                                text: 'Interface language'.tr,
                                fontSize: 17.sp,
                              ),
                              Obx(() => safeText(
                                  text: _controller.selectedLanguage.value)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                settingRow(
                  title: 'Favourite'.tr,
                  icon: const Icon(Icons.star),
                  note: _controller.shortNameChoice.value ?? '',
                  clubImage: _controller.crestChoice.value ?? '',
                  onTab: () {
                    Get.dialog(
                      AlertDialog(
                        title: safeText(text: 'Choose your team'.tr),
                        content: teamList(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget settingRow({
    required String title,
    required Icon icon,
    required String note,
    required String clubImage,
    void Function()? onTab,
  }) {
    return InkWell(
      onTap: onTab,
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: icon,
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  safeText(
                    text: title,
                    fontSize: 17.sp,
                  ),
                  Row(children: [
                    loadImages(imageUrl: clubImage, height: 20, width: 20),
                    const SizedBox(
                      width: 5,
                    ),
                    safeText(text: note),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget teamList() {
    return SizedBox(
      height: 350.h,
      width: 300.w,
      child: Scrollbar(
        thumbVisibility: true,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: _controller
                .welcomeController.commonRapidPLTeams.plTeams?.length,
            itemBuilder: (context, index) {
              final rapidTeam = _controller
                  .welcomeController.commonRapidPLTeams.plTeams?[index].team;
              final orgTeam = _controller.welcomeController
                  .findOrgTeamsFromRapid(
                      teamCode: rapidTeam?.code ?? '',
                      teamName: rapidTeam?.name ?? '');
              final fullName = rapidTeam?.name ?? '';
              final shortName = orgTeam?.shortName ?? '';
              final image = rapidTeam?.logo ?? '';
              final code = rapidTeam?.code ?? '';
              return InkWell(
                onTap: () async {
                  await changeCurrentContentByUserChoice(
                    index: index,
                    shortName: shortName,
                    fullName: fullName,
                    crest: image,
                    teamCode: code,
                  );
                },
                child: SizedBox(
                  height: 50.h,
                  width: 200.w,
                  child: infoImageRow(
                      imageUrl: image,
                      imageHeight: 30.h,
                      imageWidth: 30.w,
                      label: shortName),
                ),
              );
            }),
      ),
    );
  }

  Future<void> changeCurrentContentByUserChoice({
    required int index,
    required String shortName,
    required String fullName,
    required String crest,
    required String teamCode,
  }) async {
    _controller.welcomeController.isLoading.value = true;

    await _controller.saveFavouriteUserChoice(index, shortName);

    if (Get.isRegistered<HomeController>()) {
      _controller.homeController = Get.find<HomeController>();
      await _controller.homeController.getFavTeamNews(keySearch: fullName);
      _controller.homeController.favTitle.value = shortName;
    }

    if (Get.isRegistered<NewsController>()) {
      _controller.newsController = Get.find<NewsController>();
      await _controller.newsController.getNewsByPublishedAt(
        fullName,
        _controller.newsController.favTeamNews,
        _controller.newsController.shortFavNews,
      );
      _controller.newsController.teamCodeChoice.value = teamCode;
    }
    _controller.shortNameChoice.value = shortName;
    _controller.crestChoice.value = crest;
    Get.back();
    _controller.welcomeController.isLoading.value = false;
  }

}
