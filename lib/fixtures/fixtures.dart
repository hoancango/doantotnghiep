import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mynewapp/base_screen.dart';
import 'package:mynewapp/fixtures/matches_controller.dart';

import '../common_resources.dart';

class Fixtures extends StatefulWidget {
  const Fixtures({super.key});

  @override
  State<Fixtures> createState() => _FixturesState();
}

class _FixturesState extends State<Fixtures> {
  List<String> leagueLabels = ['Premier League', 'UEFA Champion League'];
  RxString selectedLeague = ''.obs;
  late MatchesController _controller;

  @override
  void initState() {
    _controller = Get.put(MatchesController());
    selectedLeague.value = leagueLabels[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print('Chieu rong: ${MediaQuery.sizeOf(context).width}');
    // print('Chieu cao: ${MediaQuery.sizeOf(context).height}');
    return BaseScreen(
      label: 'Lịch đấu',
      appBar: AppBar(
        title: Text(
          'Lịch đấu',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80.h),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.white,
              child: Row(
                children: [
                  leagueDropDownBox(
                    'Giải đấu',
                    leagueLabels[0],
                    leagueLabels,
                  ),
                  Container(
                    color: Colors.grey.shade300,
                    width: 2.w,
                    height: 50.h,
                  ),
                  clubDropDownBox(
                    'CLB',
                    (_controller.plTeams.isNotEmpty)
                        ? _controller.plTeams.toList()[0]
                        : '',
                  ),
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
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _controller.fixtures.toList().length,
                  itemBuilder: (BuildContext context, int index) {
                    final basePath = _controller.fixtures;
                    bool sameDay = true;

                    if (index > 0) {
                      String? formerMatchTime = basePath[index].fixture?.date;
                      String? latterMatchTime =
                          basePath[index - 1].fixture?.date;
                      if (formerMatchTime != null && latterMatchTime != null) {
                        int formerLocalDay = getLocalDay(formerMatchTime);
                        int latterLocalDay = getLocalDay(latterMatchTime);
                        sameDay = (formerLocalDay == latterLocalDay);
                      }
                    }

                    return Column(
                      children: [
                        if (index == 0 || sameDay == false)
                          safeText(
                            text: toLocalTime(
                              utcString: basePath[index].fixture?.date ??
                                  "2024-10-19T14:00:00Z",
                              byWeekday: true,
                            ),
                          ),
                        getMatches(
                          homeTeamName: basePath[index].teams?.home?.name ??
                              "Ipswich Town",
                          awayTeamName:
                              basePath[index].teams?.away?.name ?? "Everton",
                          homeTeamFlagUrl: basePath[index].teams?.home?.logo ??
                              "https://crests.football-data.org/349.png",
                          utcTime: basePath[index].fixture?.date ??
                              "2024-10-19T14:00:00Z",
                          awayTeamFlagUrl: basePath[index].teams?.away?.logo ??
                              "https://crests.football-data.org/62.png",
                        ),
                      ],
                    );
                  },
                ),
              ),

              // Padding(
              //   padding: EdgeInsets.all(8.0.w),
              //   child: Container(
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     clipBehavior: Clip.antiAlias,
              //     child: Column(
              //       children: [
              //         leagueTitle("https://crests.football-data.org/CL.png",
              //             "UEFA Champions League"),
              //         SizedBox(
              //           height: 10.h,
              //         ),
              //         getMatches(
              //           homeTeamName: "Atalanta",
              //           awayTeamName: "Celtic",
              //           homeTeamFlagUrl:
              //               "https://crests.football-data.org/102.png",
              //           utcTime: "2024-10-23T16:45:00Z",
              //           awayTeamFlagUrl:
              //               "https://crests.football-data.org/732.png",
              //         ),
              //         getMatches(
              //           homeTeamName: "Brest",
              //           awayTeamName: "Leverkusen",
              //           homeTeamFlagUrl:
              //               "https://crests.football-data.org/512.png",
              //           utcTime: "2024-10-23T19:00:00Z",
              //           awayTeamFlagUrl:
              //               "https://crests.football-data.org/3.png",
              //         ),
              //         getMatches(
              //           homeTeamName: "Man City",
              //           awayTeamName: "Sparta Praha",
              //           homeTeamFlagUrl:
              //               "https://crests.football-data.org/65.png",
              //           utcTime: "2024-10-23T19:00:00Z",
              //           awayTeamFlagUrl:
              //               "https://crests.football-data.org/907.png",
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.all(8.0.w),
              //   child: Container(
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     clipBehavior: Clip.antiAlias,
              //     child: Column(
              //       children: [
              //         leagueTitle("https://crests.football-data.org/ELC.png",
              //             "Championship"),
              //         SizedBox(
              //           height: 10.h,
              //         ),
              //         getMatches(
              //           homeTeamName: "Middlesbrough",
              //           awayTeamName: "Sheffield Utd",
              //           homeTeamFlagUrl:
              //               "https://crests.football-data.org/343.png",
              //           utcTime: "2024-10-23T16:45:00Z",
              //           awayTeamFlagUrl:
              //               "https://crests.football-data.org/356.png",
              //         ),
              //         getMatches(
              //           homeTeamName: "Hull City",
              //           awayTeamName: "Burnley",
              //           homeTeamFlagUrl:
              //               "https://crests.football-data.org/322.png",
              //           utcTime: "2024-10-23T19:00:00Z",
              //           awayTeamFlagUrl:
              //               "https://crests.football-data.org/328.png",
              //         ),
              //         getMatches(
              //           homeTeamName: "Millwall",
              //           awayTeamName: "Plymouth Arg",
              //           homeTeamFlagUrl:
              //               "https://crests.football-data.org/384.png",
              //           utcTime: "2024-10-23T19:00:00Z",
              //           awayTeamFlagUrl:
              //               "https://crests.football-data.org/1138.png",
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              SizedBox(
                height: 100.h,
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

  Widget leagueDropDownBox(
      String title, String initialValue, List<String> dropDownData) {
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
            safeText(
              text: title,
              fontSize: 12.sp,
              color: Colors.grey,
            ),
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
                  onChanged: (String? newValue) async {
                    (newValue != null) ? selectedValue.value = newValue : null;
                    if (newValue == leagueLabels[0]) {
                      selectedLeague.value = leagueLabels[0];
                      _controller.fixtures.clear();
                      _controller.fixtures.addAll(_controller.shortPlMatches);
                    }
                    if (newValue == leagueLabels[1]) {
                      selectedLeague.value = leagueLabels[1];
                      _controller.fixtures.clear();
                      if (_controller.uclMatches.isEmpty) {
                        await _controller.fetchMatches(
                            league: 2,
                            dataBase: _controller.uclMatches,
                            shortData: _controller.shortUclMatches,
                            teamsSet: _controller.uclTeams);
                      }
                      _controller.fixtures.addAll(_controller.shortUclMatches);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget clubDropDownBox(
    String title,
    String initialValue,
  ) {
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
            safeText(
              text: title,
              fontSize: 12.sp,
              color: Colors.grey,
            ),
            Obx(
              () => Container(
                height: 30.h,
                child: DropdownButton(
                  underline: const SizedBox.shrink(),
                  isExpanded: true,
                  value: selectedValue.value,
                  items: (selectedLeague.value == leagueLabels[0])
                      ? _controller.plTeams.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: safeText(text: value, fontSize: 14.sp),
                          );
                        }).toList()
                      : _controller.uclTeams.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: safeText(text: value, fontSize: 14.sp),
                          );
                        }).toList(),
                  onChanged: (String? newValue) async {
                    (newValue != null) ? selectedValue.value = newValue : null;
                    (selectedLeague.value == leagueLabels[0] &&
                            newValue != null)
                        ? _controller.sortTeams(teamName: newValue, isPL: true)
                        : null;

                    (selectedLeague.value == leagueLabels[1] &&
                            newValue != null)
                        ? _controller.sortTeams(teamName: newValue, isPL: false)
                        : null;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int getLocalDay(String utcString) {
    DateTime utcTime = DateTime.parse(utcString);
    DateTime localTime = utcTime.toLocal();
    return localTime.day;
  }
}
// responsive theo size
