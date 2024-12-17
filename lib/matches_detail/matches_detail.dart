import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mynewapp/common_resources.dart';
import 'package:mynewapp/matches_detail/matches_detail_controller.dart';

class MatchesDetail extends StatefulWidget {
  const MatchesDetail({
    super.key,
    this.teamAName = '',
    this.teamBName = '',
    this.teamAImage = '',
    this.teamBImage = '',
    this.date = '',
    this.homeGoals,
    this.awayGoals,
    this.id = 0,
  });
  final String teamAName;
  final String teamBName;
  final String teamAImage;
  final String teamBImage;
  final String date;
  final int? homeGoals;
  final int? awayGoals;
  final int id;

  @override
  State<MatchesDetail> createState() => _MatchesDetailState();
}

class _MatchesDetailState extends State<MatchesDetail> {
  late MatchesDetailController _controller;

  @override
  void initState() {
    _controller = Get.put(MatchesDetailController(),
        permanent: true, tag: '${widget.id}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: safeText(
          text:
              '${(widget.teamAName.length > 3) ? widget.teamAName.substring(0, 3) : widget.teamAName} '
              'vs '
              '${(widget.teamBName.length) > 3 ? widget.teamBName.substring(0, 3) : widget.teamBName}',
          color: Colors.white,
        ),
        backgroundColor: commonColor(),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Obx(() {
        (_controller.isLoading.value)
            ? context.loaderOverlay.show()
            : context.loaderOverlay.hide();
        final remains = remainingDays(widget.date);

        return (_controller.isLoading.value)
            ? Container()
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: teamsColumn(
                                  widget.teamAImage,
                                  widget.teamAName,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: (widget.homeGoals != null &&
                                        widget.awayGoals != null)
                                    ? Center(
                                        child: safeText(
                                            text:
                                                '${widget.homeGoals} - ${widget.awayGoals}'),
                                      )
                                    : Column(
                                        children: [
                                          safeText(
                                              text: toLocalTime(
                                                  utcString: widget.date),
                                              fontSize: 17.sp),
                                          if (remains > 0)
                                            safeText(
                                                text:
                                                    '$remains ${(remains > 1) ? 'days'.tr : 'day'.tr}'),
                                        ],
                                      ),
                              ),
                              Expanded(
                                flex: 2,
                                child: teamsColumn(
                                  widget.teamBImage,
                                  widget.teamBName,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0.h,
                      ),

                      safeText(
                        text: 'Thông số trận đấu',
                        fontSize: 15.sp,
                        isBold: true,
                      ),

                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _controller.teamAStats.toList().length,
                        itemBuilder: (context, index) {
                          final basePathA = _controller.teamAStats[index];
                          final basePathB = _controller.teamBStats[index];
                          final title = basePathA.type;
                          final teamA = basePathA.value ?? '_';
                          final teamB = basePathB.value ?? '_';
                          return Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child:
                                      Center(child: safeText(text: "$teamA"))),
                              Expanded(
                                  flex: 1,
                                  child: Center(
                                      child: safeText(text: title ?? ''))),
                              Expanded(
                                  flex: 1,
                                  child:
                                      Center(child: safeText(text: "$teamB"))),
                            ],
                          );
                        },
                      ),

                      SizedBox(
                        height: 15.0.h,
                      ),
                      safeText(
                        text: 'Thành tích đối đầu',
                        fontSize: 15.sp,
                        isBold: true,
                      ),
                      headToHeadRow(
                        text1: 'Thắng',
                        text2: 'Số trận',
                        text3: 'Thắng',
                      ),
                      headToHeadRow(
                        text1: '${_controller.teamAWinNumbers}',
                        text2: "${_controller.totalMatches}",
                        text3: '${_controller.teamBWinNumbers}',
                        detailStatsWidgetA: winRateBar(
                          matchesTotal: _controller.headToHead.length,
                          winMatches: _controller.teamAWinNumbers,
                        ),
                        detailStatsWidgetB: winRateBar(
                          isTeamA: false,
                          matchesTotal: _controller.headToHead.length,
                          winMatches: _controller.teamBWinNumbers,
                        ),
                      ),
                      headToHeadRow(
                        hasDivider: true,
                        text2: 'Hòa: ${_controller.drawNumbers}',
                      ),
                      headToHeadRow(
                          hasDivider: true,
                          text1: '${_controller.homeWinsA}',
                          text2: 'Sân nhà',
                          text3: '${_controller.homeWinsB}'),
                      headToHeadRow(
                          hasDivider: true,
                          text1: '${_controller.awayWinsA}',
                          text2: 'Sân khách',
                          text3: '${_controller.awayWinsB}'),
                      SizedBox(
                        height: 15.0.h,
                      ),
                      safeText(
                        text: 'Lịch sử đối đầu',
                        fontSize: 15.sp,
                        isBold: true,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),

                      // safeText(text: 'Chủ nhật, 24/02/2024'),
                      // getMatches(
                      //   hasScore: true,
                      //   hasNavigationArrow: false,
                      //   homeGoals: 0,
                      //   awayGoals: 1,
                      //   homeTeamName: "Bournemouth",
                      //   awayTeamName: "Manchester City",
                      //   homeTeamFlagUrl:
                      //       "https://media.api-sports.io/football/teams/35.png",
                      //   awayTeamFlagUrl:
                      //       "https://media.api-sports.io/football/teams/50.png",
                      // ),
                      // safeText(text: 'Chủ nhật, 04/11/2023'),
                      // getMatches(
                      //   hasScore: true,
                      //   hasNavigationArrow: false,
                      //   homeGoals: 6,
                      //   awayGoals: 1,
                      //   awayTeamName: "Bournemouth",
                      //   homeTeamName: "Manchester City",
                      //   awayTeamFlagUrl:
                      //       "https://media.api-sports.io/football/teams/35.png",
                      //   homeTeamFlagUrl:
                      //       "https://media.api-sports.io/football/teams/50.png",
                      // ),
                      // safeText(text: 'Chủ nhật, 25/02/2023'),
                      // getMatches(
                      //   hasScore: true,
                      //   hasNavigationArrow: false,
                      //   homeGoals: 1,
                      //   awayGoals: 4,
                      //   homeTeamName: "Bournemouth",
                      //   awayTeamName: "Manchester City",
                      //   homeTeamFlagUrl:
                      //       "https://media.api-sports.io/football/teams/35.png",
                      //   awayTeamFlagUrl:
                      //       "https://media.api-sports.io/football/teams/50.png",
                      // ),

                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              _controller.shortHeadToHead.toList().length,
                          itemBuilder: (context, index) {
                            final basePath = _controller.shortHeadToHead[index];
                            final date = basePath.fixture?.date ?? '';
                            final localTime = toLocalTime(
                              utcString: date,
                              byWeekday: true,
                            );
                            return Column(
                              children: [
                                safeText(text: localTime),
                                getMatches(
                                  hasScore: true,
                                  hasNavigationArrow: false,
                                  homeGoals: basePath.goals?.home,
                                  awayGoals: basePath.goals?.away,
                                  homeTeamName:
                                      basePath.teams?.home?.name ?? '',
                                  awayTeamName:
                                      basePath.teams?.away?.name ?? '',
                                  homeTeamFlagUrl:
                                      basePath.teams?.home?.logo ?? '',
                                  awayTeamFlagUrl:
                                      basePath.teams?.away?.logo ?? '',
                                ),
                              ],
                            );
                          }),

                      SizedBox(
                        height: 100.h,
                      ),
                    ],
                  ),
                ),
              );
      }),
    );
  }

  Widget headToHeadRow(
      {bool hasDivider = false,
      Widget? detailStatsWidgetA,
      Widget? detailStatsWidgetB,
      String text1 = '',
      String text2 = '',
      String text3 = ''}) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Center(child: safeText(text: text1)),
            ),
            Expanded(
              flex: 5,
              child: Row(
                children: [
                  if (detailStatsWidgetA != null && detailStatsWidgetB != null)
                    Expanded(
                      flex: 2,
                      child: detailStatsWidgetA,
                    ),
                  Expanded(
                    flex: 1,
                    child: Center(child: safeText(text: text2)),
                  ),
                  if (detailStatsWidgetA != null && detailStatsWidgetB != null)
                    Expanded(
                      flex: 2,
                      child: detailStatsWidgetB,
                    ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(child: safeText(text: text3)),
            ),
          ],
        ),
        if (hasDivider == true)
          Divider(
            color: Colors.grey.shade500,
            thickness: 1.0,
            height: 20.0,
          ),
      ],
    );
  }

  Widget teamsColumn(String imageUrl, String teamsName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        loadImages(
          imageUrl: imageUrl,
          height: 50.h,
          width: 50.w,
        ),
        safeText(
          text: teamsName,
          fontSize: 15.sp,
        ),
      ],
    );
  }

  Widget winRateBar({
    bool isTeamA = true,
    required int matchesTotal,
    required int winMatches,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10.0.w),
      ),
      child: Row(
        children: [
          if (isTeamA == true)
            Expanded(
              flex: matchesTotal - winMatches,
              child: SizedBox(
                height: 10.h,
              ),
            ),
          Expanded(
            flex: winMatches,
            child: Container(
              height: 10.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0.w),
                color: Colors.red,
              ),
            ),
          ),
          if (isTeamA == false)
            Expanded(
              flex: matchesTotal - winMatches,
              child: SizedBox(
                height: 10.h,
              ),
            ),
        ],
      ),
    );
  }

  Widget lastFormRow(
      {required String opTeamFlagUrl,
      required int homeGoals,
      required int awayGoals,
      required bool isAHome,
      required String opTeamName,
      bool isTeamA = true}) {
    String opTeamRole = '';
    String resultA = '';
    (isAHome == true) ? opTeamRole = 'A' : opTeamRole = 'H';

    (homeGoals != awayGoals)
        ? (homeGoals > awayGoals)
            ? (isAHome == true)
                ? resultA = 'W'
                : resultA = 'L'
            : (isAHome == true)
                ? resultA = 'L'
                : resultA = 'W'
        : resultA = 'D';

    return Row(
      mainAxisAlignment:
          (isTeamA == true) ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (isTeamA == false)
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (resultA == 'W')
                  ? Colors.green
                  : (resultA == 'L')
                      ? Colors.red
                      : Colors.grey,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: safeText(text: resultA),
            ),
          ),
        if (isTeamA == false)
          loadImages(
            imageUrl: opTeamFlagUrl,
            height: 30.h,
            width: 30.w,
          ),
        safeText(
            text:
                '$homeGoals-$awayGoals v ${opTeamName.substring(0, 3)}($opTeamRole)'),
        if (isTeamA == true)
          loadImages(
            imageUrl: opTeamFlagUrl,
            height: 30.h,
            width: 30.w,
          ),
        if (isTeamA == true)
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (resultA == 'W')
                  ? Colors.green
                  : (resultA == 'L')
                      ? Colors.red
                      : Colors.grey,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: safeText(text: resultA),
            ),
          ),
      ],
    );
  }

  Widget recentForm() {
    return Column(
      children: [
        SizedBox(
          height: 15.0.h,
        ),
        safeText(
          text: 'Phong độ gần đây',
          fontSize: 15.sp,
          isBold: true,
        ),
        SizedBox(
          height: 5.h,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: lastFormRow(
                  opTeamFlagUrl:
                      "https://media.api-sports.io/football/teams/66.png",
                  homeGoals: 1,
                  awayGoals: 1,
                  isAHome: true,
                  opTeamName: "Aston Villa"),
            ),
            SizedBox(
              width: 10.0.w,
            ),
            Expanded(
              flex: 1,
              child: lastFormRow(
                  isTeamA: false,
                  opTeamFlagUrl:
                      "https://media.api-sports.io/football/teams/41.png",
                  homeGoals: 1,
                  awayGoals: 0,
                  isAHome: true,
                  opTeamName: "Southampton"),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: lastFormRow(
                  opTeamFlagUrl:
                      "https://media.api-sports.io/football/teams/46.png",
                  homeGoals: 1,
                  awayGoals: 0,
                  isAHome: false,
                  opTeamName: "Leicester"),
            ),
            SizedBox(
              width: 10.0.w,
            ),
            Expanded(
              flex: 1,
              child: lastFormRow(
                  isTeamA: false,
                  opTeamFlagUrl:
                      "https://media.api-sports.io/football/teams/628.png",
                  homeGoals: 5,
                  awayGoals: 0,
                  isAHome: true,
                  opTeamName: "Sparta Praha"),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: lastFormRow(
                  opTeamFlagUrl:
                      "https://media.api-sports.io/football/teams/41.png",
                  homeGoals: 3,
                  awayGoals: 1,
                  isAHome: true,
                  opTeamName: "Southampton"),
            ),
            SizedBox(
              width: 10.0.w,
            ),
            Expanded(
              flex: 1,
              child: lastFormRow(
                  isTeamA: false,
                  opTeamFlagUrl:
                      "https://media.api-sports.io/football/teams/39.png",
                  homeGoals: 1,
                  awayGoals: 2,
                  isAHome: false,
                  opTeamName: "Wolves"),
            ),
          ],
        ),
      ],
    );
  }

  int remainingDays(String timeString) {
    DateTime targetLocalTime = DateTime.parse(timeString).toLocal();
    Duration different = targetLocalTime.difference(DateTime.now());
    return different.inDays;
  }
}
