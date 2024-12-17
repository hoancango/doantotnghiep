import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mynewapp/base_screen.dart';
import 'package:mynewapp/fixtures/matches_controller.dart';
import 'package:mynewapp/matches_detail/matches_detail.dart';

import '../common_resources.dart';

class Fixtures extends StatefulWidget {
  const Fixtures({super.key});

  @override
  State<Fixtures> createState() => _FixturesState();
}

class _FixturesState extends State<Fixtures>
    with AutomaticKeepAliveClientMixin {
  List<String> leagueLabels = ['Premier League', 'UEFA Champion League'];
  RxString selectedLeague = ''.obs;
  RxString globalSelectedValue = ''.obs;
  late MatchesController _controller;
  late ScrollController _scrollController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _controller = Get.put(
      MatchesController(),
      permanent: true,
    );
    selectedLeague.value = leagueLabels[0];
    globalSelectedValue.value = _controller.plTeams.toList()[0];
    _scrollController = ScrollController();
    _scrollController.addListener(manageNumbersOfMatches);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BaseScreen(
      label: 'Fixtures'.tr,
      appBar: AppBar(
        title: Text(
          'Fixtures'.tr,
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
                    'Leagues'.tr,
                    leagueLabels[0],
                    leagueLabels,
                  ),
                  Container(
                    color: Colors.grey.shade300,
                    width: 2.w,
                    height: 50.h,
                  ),
                  clubDropDownBox(
                    title: 'Clubs'.tr,
                  ),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: commonColor(),
      ),
      body: Obx(() {
        (_controller.isLoading.value)
            ? context.loaderOverlay.show()
            : context.loaderOverlay.hide();

        return (_controller.isLoading.value)
            ? Container()
            : SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      cacheExtent: 1000,
                      itemCount: _controller.fixtures.toList().length,
                      itemBuilder: (BuildContext context, int index) {
                        final basePath = _controller.fixtures;
                        bool sameDay = true;

                        if (index > 0) {
                          String? formerMatchTime =
                              basePath[index].fixture?.date;
                          String? latterMatchTime =
                              basePath[index - 1].fixture?.date;
                          if (formerMatchTime != null &&
                              latterMatchTime != null) {
                            int formerLocalDay = getLocalDay(formerMatchTime);
                            int latterLocalDay = getLocalDay(latterMatchTime);
                            sameDay = (formerLocalDay == latterLocalDay);
                          }
                        }

                        bool hasScore = false;
                        final homeGoals = basePath[index].goals?.home;
                        final awayGoals = basePath[index].goals?.away;
                        if (homeGoals != null && awayGoals != null) {
                          hasScore = true;
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
                            InkWell(
                              onTap: () {
                                // matchDetailNavigation(index);
                              },
                              child: getMatches(
                                homeTeamName:
                                    basePath[index].teams?.home?.name ??
                                        "Ipswich Town",
                                awayTeamName:
                                    basePath[index].teams?.away?.name ??
                                        "Everton",
                                homeTeamFlagUrl: basePath[index]
                                        .teams
                                        ?.home
                                        ?.logo ??
                                    "https://crests.football-data.org/349.png",
                                utcTime: basePath[index].fixture?.date ??
                                    "2024-10-19T14:00:00Z",
                                awayTeamFlagUrl: basePath[index]
                                        .teams
                                        ?.away
                                        ?.logo ??
                                    "https://crests.football-data.org/62.png",
                                hasScore: hasScore,
                                homeGoals: homeGoals,
                                awayGoals: awayGoals,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                  ],
                ),
              );
      }),
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
                  dropdownColor: Colors.white,
                  iconEnabledColor: Colors.black,
                  value: selectedValue.value,
                  items: dropDownData.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: safeText(
                        text: value,
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) async {
                    (newValue != null) ? selectedValue.value = newValue : null;
                    if (newValue == leagueLabels[0]) {
                      selectedLeague.value = leagueLabels[0];
                      globalSelectedValue.value =
                          _controller.plTeams.toList()[0];
                      _controller.manageData(
                          dataBase: _controller.plMatches,
                          shortData: _controller.shortPlMatches);
                      _controller.fixtures.clear();
                      _controller.fixtures.addAll(_controller.shortPlMatches);
                      _controller.dataSource = _controller.plMatches;
                    }
                    if (newValue == leagueLabels[1]) {
                      selectedLeague.value = leagueLabels[1];
                      globalSelectedValue.value =
                          _controller.uclTeams.toList()[0];
                      _controller.fixtures.clear();
                      if (_controller.uclMatches.isEmpty) {
                        _controller.isLoading.value = true;
                        await _controller.fetchMatches(
                            league: 2,
                            dataBase: _controller.uclMatches,
                            shortData: _controller.shortUclMatches,
                            teamsSet: _controller.uclTeams);
                        _controller.isLoading.value = false;
                      }
                      _controller.manageData(
                          dataBase: _controller.uclMatches,
                          shortData: _controller.shortUclMatches);
                      _controller.dataSource = _controller.uclMatches;
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

  Widget clubDropDownBox({
    required String title,
  }) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 60.h,
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
                  dropdownColor: Colors.white,
                  iconEnabledColor: Colors.black,
                  value: globalSelectedValue.value,
                  items: (selectedLeague.value == leagueLabels[0])
                      ? _controller.plTeams.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: safeText(
                              text: value,
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                          );
                        }).toList()
                      : _controller.uclTeams.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: safeText(
                              text: value,
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                          );
                        }).toList(),
                  onChanged: (String? newValue) async {
                    (newValue != null)
                        ? globalSelectedValue.value = newValue
                        : null;
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

  void manageNumbersOfMatches() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _controller.loadMore(_controller.dataSource);
      } else if (_scrollController.position.pixels ==
          _scrollController.position.minScrollExtent) {
        _controller.loadMoreOnTop(_controller.dataSource);
      }
    }
  }

  void matchDetailNavigation(int index) {
    final basePath = _controller.fixtures;
    final matchId = basePath[index].fixture?.id;
    final homeTeamId = basePath[index].teams?.home?.id;
    final awayTeamId = basePath[index].teams?.away?.id;
    if (matchId != null && homeTeamId != null && awayTeamId != null) {
      Get.to(
          MatchesDetail(
            teamAName: basePath[index].teams?.home?.name ?? '',
            teamBName: basePath[index].teams?.away?.name ?? '',
            teamAImage: basePath[index].teams?.home?.logo ?? '',
            teamBImage: basePath[index].teams?.away?.logo ?? '',
            date: basePath[index].fixture?.date ?? '',
            homeGoals: basePath[index].goals?.home,
            awayGoals: basePath[index].goals?.away,
            id: matchId,
          ),
          arguments: {
            'matchId': matchId,
            'homeTeamId': homeTeamId,
            'awayTeamId': awayTeamId,
          });
    }
  }
}
// responsive theo size
