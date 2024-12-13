import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mynewapp/base_screen.dart';
import 'package:mynewapp/common_data/common_data_org_teams.dart';
import 'package:mynewapp/common_resources.dart';
import 'package:mynewapp/home/home_controller.dart';
import 'package:mynewapp/home/home_screen.dart';
import 'package:mynewapp/welcome/fav_controller.dart';

class FavTeamQues extends StatefulWidget {
  const FavTeamQues({super.key});

  @override
  State<FavTeamQues> createState() => _FavTeamQuesState();
}

class _FavTeamQuesState extends State<FavTeamQues> {
  late FavouriteQuestController _controller;
  // RxInt selectedIndex = (-1).obs;
  // int selectedOrgId = -1;
  // Color selectedColor = Colors.grey;

  @override
  void initState() {
    _controller = FavouriteQuestController();
    // se bo qua onInit cua get x
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ever(_controller.isLoading, (value) {
      (value == true)
          ? context.loaderOverlay.show()
          : context.loaderOverlay.hide();
    });

    return BaseScreen(
      backgroundColor: commonColor(),
      label: 'Favourite'.tr,
      haveNavigationButtons: false,
      appBar: AppBar(
        title: safeText(text: 'Favourite'.tr, color: Colors.white),
        backgroundColor: commonColor(),
        iconTheme: const IconThemeData(color: Colors.white),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.h),
          child: Center(
              child: safeText(
                  text: 'Which is your favourite team?'.tr,
                  color: Colors.white)),
        ),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: teamList(),
              ),
              SizedBox(
                height: 70.h,
              ),
            ],
          ),
        ),
        Obx(
          () => Align(
            alignment: Alignment.bottomCenter,
            child: AbsorbPointer(
              absorbing: (_controller.selectedIndex.value == -1),
              child: InkWell(
                onTap: () async {
                  // final rapidFavTeam = _controller
                  //     .commonRapidPLTeams.plTeams?[selectedIndex.value];
                  // final teamName = rapidFavTeam?.team?.name;
                  // if (teamName != null) {
                  //   _controller.saveFavTeamNews(teamName);
                  // }
                  // if(rapidFavTeam != null){
                  //  _controller.favTeams.add(rapidFavTeam);
                  // }
                  // _controller.orgIds.add(selectedOrgId);
                  // _controller.colorByTeams.add(selectedColor);
                  //TO DO: Save

                  await _controller.saveUserFavChoice();
                  Get.off(const Home());
                },
                child: Container(
                  foregroundDecoration: (_controller.selectedIndex.value == -1)
                      ? BoxDecoration(color: Colors.white.withOpacity(0.5))
                      : null,
                  height: 50.h,
                  width: ScreenUtil().screenWidth,
                  color: Colors.pink,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      safeText(
                          text: 'Go Home'.tr,
                          color: Colors.white,
                          fontSize: 15.sp),
                      SizedBox(
                        width: 5.w,
                      ),
                      const Icon(
                        Icons.arrow_forward_outlined,
                        color: Colors.white,
                        size: 19,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  // Widget teamList() {
  //   return GridView.builder(
  //       shrinkWrap: true,
  //       physics: const NeverScrollableScrollPhysics(),
  //       itemCount: orgPlTeams['teams'].length,
  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 3,
  //         crossAxisSpacing: 10.w,
  //         mainAxisSpacing: 10.h,
  //       ),
  //       itemBuilder: (context, index) {
  //         String crest = orgPlTeams['teams'][index]['crest'];
  //         String shortName = orgPlTeams['teams'][index]['shortName'];
  //         String clubColors = orgPlTeams['teams'][index]['clubColors'];
  //         return teamBlock(crest, shortName, clubColors);
  //       });
  // }

  Widget teamList() {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _controller.commonRapidPLTeams.plTeams?.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
        ),
        itemBuilder: (context, index) {
          final basePath = _controller.commonRapidPLTeams.plTeams?[index];
          final orgData = _controller.findOrgTeamsFromRapid(
              teamCode: basePath?.team?.code ?? '',
              teamName: basePath?.team?.name ?? '');
          int orgId = orgData?.id ?? 0;
          String crest = orgData?.crest ?? '';
          String shortName = orgData?.shortName ?? '';
          Color clubColors = convertColor(orgData?.clubColors ?? '');
          return InkWell(
              onTap: () {
                _controller.selectedIndex.value = index;
                _controller.selectedOrgId = orgId;
                _controller.selectedColor = clubColors;
                _controller.selectedOrgShortName = shortName;
              },
              child: teamBlock(
                crest,
                shortName,
                clubColors,
                index,
              ));
        });
  }

  Widget teamBlock(
    String crest,
    String shortName,
    Color clubColors,
    int index,
  ) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: (_controller.selectedIndex.value == index)
              ? clubColors
              : Colors.white,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  loadImages(
                    imageUrl: crest,
                    height: 50.h,
                    width: 50.w,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  safeText(
                    text: shortName,
                    fontSize: 12.sp,
                    isBold: true,
                    color: (_controller.selectedIndex.value == index &&
                            clubColors != Colors.white)
                        ? Colors.white
                        : Colors.grey.shade800,
                  ),
                ],
              ),
            ),
            if (_controller.selectedIndex.value == index)
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 20.h,
                    width: 20.h,
                    decoration: BoxDecoration(
                        color: commonColor(), shape: BoxShape.circle),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Color convertColor(String input) {
  //   List<String> modifiedInput = input.split(' ');
  //   String filteredInput = '';
  //
  //   Map<String, Color> colorMap = {
  //     'red': Colors.red,
  //     'blue': Colors.blue,
  //     'green': Colors.green,
  //     'yellow': Colors.yellow,
  //     'orange': Colors.orange,
  //     'purple': Colors.purple,
  //     'pink': Colors.pink,
  //     'brown': Colors.brown,
  //     'grey': Colors.grey,
  //     'black': Colors.black,
  //     'white': Colors.white,
  //     'cyan': Colors.cyan,
  //     'lime': Colors.lime,
  //     'teal': Colors.teal,
  //     'indigo': Colors.indigo,
  //     'amber': Colors.amber,
  //   };
  //   filteredInput = modifiedInput
  //       .firstWhere((modInput) => colorMap.containsKey(modInput.toLowerCase()));
  //
  //   return colorMap[filteredInput.toLowerCase()] ?? Colors.grey;
  // }
}
