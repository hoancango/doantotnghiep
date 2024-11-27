import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mynewapp/base_screen.dart';
import 'package:mynewapp/common_data/common_data_org_teams.dart';
import 'package:mynewapp/common_resources.dart';

class FavTeamQues extends StatefulWidget {
  const FavTeamQues({super.key});

  @override
  State<FavTeamQues> createState() => _FavTeamQuesState();
}

class _FavTeamQuesState extends State<FavTeamQues> {
  RxString selectedTeam = ''.obs;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: commonColor(),
      label: 'Favourite Team',
      haveNavigationButtons: false,
      appBar: AppBar(
        title: safeText(text: 'Favourite Team', color: Colors.white),
        backgroundColor: commonColor(),
        iconTheme: const IconThemeData(color: Colors.white),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.h),
          child: Center(
              child: safeText(
                  text: 'Who is your favourite team?', color: Colors.white)),
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
              SizedBox(height: 70.h,),
            ],
          ),
        ),

        Obx(
            ()=> Align(
              alignment: Alignment.bottomCenter,
              child: AbsorbPointer(
                absorbing: (selectedTeam.value == ''),
                child: Container(
                  foregroundDecoration: (selectedTeam.value == '')?BoxDecoration(color: Colors.white.withOpacity(0.5)):null,
                  height: 50.h,
                  width: ScreenUtil().screenWidth,
                  color: Colors.pink,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      safeText(text: 'Creat account', color: Colors.white, fontSize: 15.sp),
                      SizedBox(width: 5.w,),
                      const Icon(Icons.arrow_forward_outlined, color: Colors.white, size: 19,),
                    ],
                  ),
                ),
              ),
            ),
        ),
      ]),
    );
  }

  Widget teamList() {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: orgPlTeams.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
        ),
        itemBuilder: (context, index) {
          String crest = orgPlTeams[index]['crest'];
          String shortName = orgPlTeams[index]['shortName'];
          String clubColors = orgPlTeams[index]['clubColors'];
          return teamBlock(crest, shortName, clubColors);
        });
  }

  Widget teamBlock(String crest, String shortName, String clubColors) {
    return InkWell(
      onTap: () {
        selectedTeam.value = shortName;
      },
      child: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: (selectedTeam.value == shortName)
                ? convertColor(clubColors)
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
                      color: (selectedTeam.value == shortName &&
                              convertColor(clubColors) != Colors.white)
                          ? Colors.white
                          : null,
                    ),
                  ],
                ),
              ),
              if (selectedTeam.value == shortName)
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
      ),
    );
  }

  Color convertColor(String input) {
    List<String> modifiedInput = input.split(' ');
    String filteredInput = '';

    Map<String, Color> colorMap = {
      'red': Colors.red,
      'blue': Colors.blue,
      'green': Colors.green,
      'yellow': Colors.yellow,
      'orange': Colors.orange,
      'purple': Colors.purple,
      'pink': Colors.pink,
      'brown': Colors.brown,
      'grey': Colors.grey,
      'black': Colors.black,
      'white': Colors.white,
      'cyan': Colors.cyan,
      'lime': Colors.lime,
      'teal': Colors.teal,
      'indigo': Colors.indigo,
      'amber': Colors.amber,
    };
    filteredInput = modifiedInput
        .firstWhere((modInput) => colorMap.containsKey(modInput.toLowerCase()));

    return colorMap[filteredInput.toLowerCase()] ?? Colors.grey;
  }
}
