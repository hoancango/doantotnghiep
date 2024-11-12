import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mynewapp/base_screen.dart';

import '../common_resources.dart';

class Fixtures extends StatefulWidget {
  const Fixtures({super.key});

  @override
  State<Fixtures> createState() => _FixturesState();
}

class _FixturesState extends State<Fixtures> {
  List<String> leagueData = ['Premier League', 'La Liga', 'UEFA Champion League ABCDE'];
  List<String> clubDataByCompetition = ['Tất cả', 'Man Utd', 'Man City'];

  @override
  Widget build(BuildContext context) {
    // print('Chieu rong: ${MediaQuery.sizeOf(context).width}');
    // print('Chieu cao: ${MediaQuery.sizeOf(context).height}');
    return BaseScreen(
      label: 'Lịch đấu',
      appBar: AppBar(
        title: Text('Lịch đấu',style: TextStyle(color: Colors.white,),),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80.h),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.white,
              child: Row(
                children: [
                  dropDownBox('Giải đấu','Premier League', leagueData,),
                  Container(color: Colors.grey.shade300, width: 2.w,height: 50.h,),
                  dropDownBox('CLB','Tất cả', clubDataByCompetition,),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: commonColor(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   height: 50.h,
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 5,
              //     itemBuilder: (context, index) {
              //       return Center(child: dateLabel(index));
              //     },
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      leagueTitle("https://crests.football-data.org/CL.png",
                          "UEFA Champions League"),
                      SizedBox(
                        height: 10.h,
                      ),
                      getMatches(
                        homeTeamName: "Atalanta",
                        awayTeamName: "Celtic",
                        homeTeamFlagUrl:
                            "https://crests.football-data.org/102.png",
                        utcTime: "2024-10-23T16:45:00Z",
                        awayTeamFlagUrl:
                            "https://crests.football-data.org/732.png",
                      ),
                      getMatches(
                        homeTeamName: "Brest",
                        awayTeamName: "Leverkusen",
                        homeTeamFlagUrl:
                            "https://crests.football-data.org/512.png",
                        utcTime: "2024-10-23T19:00:00Z",
                        awayTeamFlagUrl:
                            "https://crests.football-data.org/3.png",
                      ),
                      getMatches(
                        homeTeamName: "Man City",
                        awayTeamName: "Sparta Praha",
                        homeTeamFlagUrl:
                            "https://crests.football-data.org/65.png",
                        utcTime: "2024-10-23T19:00:00Z",
                        awayTeamFlagUrl:
                            "https://crests.football-data.org/907.png",
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      leagueTitle("https://crests.football-data.org/ELC.png",
                          "Championship"),
                      SizedBox(
                        height: 10.h,
                      ),
                      getMatches(
                        homeTeamName: "Middlesbrough",
                        awayTeamName: "Sheffield Utd",
                        homeTeamFlagUrl:
                            "https://crests.football-data.org/343.png",
                        utcTime: "2024-10-23T16:45:00Z",
                        awayTeamFlagUrl:
                            "https://crests.football-data.org/356.png",
                      ),
                      getMatches(
                        homeTeamName: "Hull City",
                        awayTeamName: "Burnley",
                        homeTeamFlagUrl:
                            "https://crests.football-data.org/322.png",
                        utcTime: "2024-10-23T19:00:00Z",
                        awayTeamFlagUrl:
                            "https://crests.football-data.org/328.png",
                      ),
                      getMatches(
                        homeTeamName: "Millwall",
                        awayTeamName: "Plymouth Arg",
                        homeTeamFlagUrl:
                            "https://crests.football-data.org/384.png",
                        utcTime: "2024-10-23T19:00:00Z",
                        awayTeamFlagUrl:
                            "https://crests.football-data.org/1138.png",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget leagueTitle(String src, String competition) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 40.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    loadImages(imageUrl: src, height: 30.h, width: 30.w),
                    SizedBox(
                      width: 5.0.w,
                    ),
                    safeText(
                      text: competition,
                      isBold: true,
                      fontSize: 16.sp,
                    ), // research safeText
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Icon(Icons.arrow_drop_down),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget dateLabel(int index) {
    DateTime today = DateTime.now();
    DateTime yesterday = today.subtract(const Duration(days: 1));
    DateTime tomorrow = today.add(const Duration(days: 1));
    //make code simpler!!!
    int weekDay = today
        .add(Duration(days: index))
        .subtract(const Duration(days: 2))
        .weekday;
    int day =
        today.add(Duration(days: index)).subtract(const Duration(days: 2)).day;
    int month = today
        .add(Duration(days: index))
        .subtract(const Duration(days: 2))
        .month;

    return Container(
      foregroundDecoration: BoxDecoration(
        color: (index != 2) ? Colors.white.withOpacity(0.5) : null,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        //make code simpler!!!
        child: (weekDay == today.weekday)
            ? const Text(
                'Hôm nay',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            : (weekDay == tomorrow.weekday)
                ? const Text('Ngày mai',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ))
                : (weekDay == yesterday.weekday)
                    ? const Text('Hôm qua',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                    : Text(
                        '${weekDayFormatter(weekDay)} $day-$month',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
      ),
    );
  }

  String weekDayFormatter(int weekDayInt) {
    String result = '';
    (weekDayInt == 1) ? result = 'CN' : result = 'T$weekDayInt';
    return result;
  }

  Widget dropDownBox(String title, String initialValue, List<String> dropDownData) {
    RxString selectedValue = initialValue.obs;
    return Expanded(
      flex: 1,
      child: Container(
        height: 60.h,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            safeText(text: title, fontSize: 12.sp, color: Colors.grey,),
            Obx(
              () => Container(
              height: 30.h,
              child: DropdownButton(
                underline: const SizedBox.shrink(),
                isExpanded: true,
                value: selectedValue.value,
                items: dropDownData.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: safeText(text: value, fontSize: 14.sp),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  (newValue != null) ? selectedValue.value = newValue : null;
                },
              ),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
// responsive theo size
