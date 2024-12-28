import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mynewapp/base_screen.dart';
import 'package:mynewapp/common_resources.dart';
import 'package:mynewapp/custom_tab_bar.dart';
import 'package:mynewapp/fixtures/fixtures.dart';
import 'package:mynewapp/home/home_controller.dart';
import 'package:mynewapp/main.dart';
import 'package:mynewapp/matches_detail/matches_detail.dart';
import 'package:mynewapp/news/news_screen.dart';
import 'package:mynewapp/news_detail/detailNews.dart';
import 'package:mynewapp/standings/standings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _LatestState();
}

class _LatestState extends State<Home> {
  late HomeController _controller;

  @override
  void initState() {
    _controller = (Get.isRegistered<HomeController>())
        ? Get.find<HomeController>()
        : Get.put(HomeController(), permanent: true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      label: 'Collection'.tr,
      appBar: AppBar(
        title: safeText(text: 'Collection'.tr, color: Colors.white),
        backgroundColor: commonColor(),
      ),
      body: Obx(() {
        (_controller.isLoading.value)
            ? context.loaderOverlay.show()
            : context.loaderOverlay.hide();
        return (_controller.isLoading.value == false &&
                _controller.isError.value == false)
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: commonColor(),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            topNews(),
                            secondTopNews(),
                            SizedBox(
                              height: 20,
                            ),
                            moreNews(
                              index: 3,
                              title: (_controller.articlesList.length > 10)
                                  ? _controller.articlesList[3].title ?? ''
                                  : 'The key points we will be putting to the Football Regulator on Day 1',
                            ),
                            moreNews(
                              index: 4,
                              title: (_controller.articlesList.length > 10)
                                  ? _controller.articlesList[4].title ?? ''
                                  : 'Ted Lasso Blu-Ray Box Set Gets Significant Price Cut For Prime Big Deal Days',
                            ),
                            moreNews(
                                index: 5,
                                title: (_controller.articlesList.length > 10)
                                    ? _controller.articlesList[5].title ?? ''
                                    : 'Jack Taylor excited by the prospect of winning first Ireland cap'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0.w),
                      child: CustomTabView(
                        tabsHeights: [900.h, 500.h],
                        tabs: ['Matches'.tr, 'League Table'.tr],
                        physics: const NeverScrollableScrollPhysics(),
                        tabContents: [
                          matchesTab(),
                          standingsTab(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Column(
                          children: [
                            //Logic bấm nút

                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow.shade800,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "${_controller.favTitle ?? 'Favourite'.tr}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),


                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: (_controller.favTeamNews.length > 3)
                                    ? 3
                                    : _controller.favTeamNews.length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final basePath =
                                      _controller.favTeamNews[index];
                                  return otherNews(
                                      isFavNews: true,
                                      index: index,
                                      favImageUrl: basePath.urlToImage ??
                                          "https://ichef.bbci.co.uk/ace/standard/1024/cpsprodpb/0adb/live/4a04a790-87c9-11ef-b6b0-c9af5f7f16e4.jpg",
                                      title: basePath.title ??
                                          "Rooney reflects on pictures from his career");
                                }),

                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Other news'.tr,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            otherNews(
                              index: 6,
                              favImageUrl: (_controller.articlesList.length >
                                      10)
                                  ? _controller.articlesList[6].urlToImage ?? ''
                                  : "https://cdn.vox-cdn.com/thumbor/2YQTIGYCTgHgJhj6sWWiwUF1ZEw=/0x247:5138x2937/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/25670786/2176189832.jpg",
                              title: (_controller.articlesList.length > 10)
                                  ? _controller.articlesList[6].title ?? ''
                                  : "Everton Women vs West Ham United: WSL Match Preview",
                            ),

                            otherNews(
                              index: 7,
                              favImageUrl: (_controller.articlesList.length >
                                      10)
                                  ? _controller.articlesList[7].urlToImage ?? ''
                                  : "https://www.americanbankingnews.com/wp-content/timthumb/timthumb.php?src=https://www.marketbeat.com/logos/kb-home-logo-1200x675.png&w=240&h=240&zc=2",
                              title: (_controller.articlesList.length > 10)
                                  ? _controller.articlesList[7].title ?? ''
                                  : "FY2024 Earnings Forecast for KB Home (NYSE:KBH) Issued By Zacks Research",
                            ),

                            otherNews(
                              index: 8,
                              favImageUrl: (_controller.articlesList.length >
                                      10)
                                  ? _controller.articlesList[8].urlToImage ?? ''
                                  : "https://focus.independent.ie/thumbor/ZhBM2PoIUktnLguQk_6p-y24zXQ=/629x460/smart/prod-mh-ireland/e0dca258-f1c0-4dd3-8c89-3967d9dbca35/28289532-5f7f-4b8f-93e3-8de32aa251ed/GettyImages_1250538383.jpg",
                              title: (_controller.articlesList.length > 10)
                                  ? _controller.articlesList[8].title ?? ''
                                  : "Letters: As election time looms, pensioners will not forget Budget 2025",
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              )
            : Container();
      }),
    );
  }

  Widget topNews() {
    final basePath = _controller.articlesList;
    return InkWell(
      onTap: () {
        Get.to(
          DetailNews(
            newsTitle: basePath[0].title ?? '',
            imageUrl: basePath[0].urlToImage ?? '',
            content: basePath[0].content ?? '',
            otherInfo: 'Popular'.tr,
            description: basePath[0].description ?? '',
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          loadImages(
            imageUrl: (basePath.length > 10)
                ? basePath[0].urlToImage ?? ''
                : 'https://img2.thejournal.ie/article/6509629/river/?height=400&version=6509572',
            height: 270.h,
            width: ScreenUtil().screenWidth,
            circularRadius: 10,
          ),
          Text(
            'Popular'.tr,
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            (basePath.length > 10)
                ? basePath[0].title ?? ''
                : 'Former Liverpool boss Jurgen Klopp lands new role as Red Bull’s global head of soccer',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            (basePath.length > 10)
                ? basePath[0].description ?? ''
                : 'The 57-year-old German will join Red Bull on 1 January, overseeing the company’s network of clubs.',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget secondTopNews() {
    return Row(
      children: [
        getNews(
            imageUrl: (_controller.articlesList.length > 10)
                ? _controller.articlesList[1].urlToImage ?? ''
                : 'https://static.bangkokpost.com/media/content/20241009/c1_2880663_700.jpg',
            type: 'Popular'.tr,
            title: (_controller.articlesList.length > 10)
                ? _controller.articlesList[1].title ?? ''
                : 'Red Bull hires Juergen Klopp as head of global soccer',
            description: (_controller.articlesList.length > 10)
                ? _controller.articlesList[1].description ?? ''
                : 'Juergen Klopp is joining Red Bull as its &ldquo;head of global soccer&rdquo;, less than six months after stepping down as the coach of the English Premier League club Liverpool FC.',
            content: (_controller.articlesList.length > 10)
                ? _controller.articlesList[1].content ?? ''
                : ''),
        getNews(
            imageUrl: (_controller.articlesList.length > 10)
                ? _controller.articlesList[2].urlToImage ?? ''
                : "https://untold-arsenal.com/wp-content/uploads/2023/07/Football-should-be-an-art.jpg",
            type: 'Popular'.tr,
            title: (_controller.articlesList.length > 10)
                ? _controller.articlesList[2].title ?? ''
                : 'The key points we will be putting to the Football Regulator on Day 1',
            description: (_controller.articlesList.length > 10)
                ? _controller.articlesList[2].description ?? ''
                : 'The battle lines are drawn, but the Premier League has the winning hand. ManC case against League leaves League free to make two minor amendments By Tony Attwood It is being said in political circles that the bill to introduce the Football Regulator into Engl…',
            content: (_controller.articlesList.length > 10)
                ? _controller.articlesList[1].content ?? ''
                : ''),
      ],
    );
  }

  Widget getNews({
    required String imageUrl,
    required String type,
    required String title,
    required String description,
    required String content,
  }) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {
          Get.to(DetailNews(
            newsTitle: title,
            imageUrl: imageUrl,
            content: content,
            otherInfo: 'Popular'.tr,
            description: description,
          ));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              loadImages(
                imageUrl: imageUrl,
                height: 130,
                width: 200,
                circularRadius: 10,
              ),
              Text(
                type,
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                description,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget moreNews({required String title, required int index}) {
    final basePath = _controller.articlesList;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 3.0),
      child: InkWell(
        onTap: () {
          Get.to(DetailNews(
            newsTitle: title,
            imageUrl: basePath[index].urlToImage ?? '',
            content: basePath[index].content ?? '',
            otherInfo: 'Popular'.tr,
            description: basePath[index].description ?? '',
          ));
        },
        child: Row(
          children: [
            Icon(
              Icons.newspaper,
              color: Colors.white,
            ),
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget otherNews({
    required int index,
    bool isFavNews = false,
    required String favImageUrl,
    required String title,
  }) {
    final basePath = _controller.articlesList;
    final favPath = _controller.favTeamNews;
    return InkWell(
      onTap: () {
        Get.to(DetailNews(
          newsTitle: title,
          imageUrl: (isFavNews == true)
              ? favPath[index].urlToImage ?? ''
              : basePath[index].urlToImage ?? '',
          content: (isFavNews == true)
              ? favPath[index].content ?? ''
              : basePath[index].content ?? '',
          otherInfo: 'Popular'.tr,
          description: (isFavNews == true)
              ? favPath[index].description ?? ''
              : basePath[index].description ?? '',
        ));
      },
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: loadImages(
                imageUrl: favImageUrl,
                height: 50,
                width: 50,
                circularRadius: 10,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget matchesTab() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0.w),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Obx(
                  () => Text(
                    '${'Matchweek'.tr} ${_controller.round.value}',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            //Text('League Table'),
            // if touch league table button
          ),
          Text('All times shown are your local time'.tr),
          // Text('Thứ 7 ngày 19 tháng 10'),

          Obx(
            () => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _controller.fixturesList.length,
              itemBuilder: (BuildContext context, int index) {
                final basePath = _controller.fixturesList;
                bool sameDay = true;

                if (index > 0) {
                  String? formerMatchTime = basePath[index].fixture?.date;
                  String? latterMatchTime = basePath[index - 1].fixture?.date;
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
                          utcString:
                              _controller.fixturesList[index].fixture?.date ??
                                  "2024-10-19T14:00:00Z",
                          byWeekday: true,
                        ),
                      ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    getMatches(
                      homeTeamName:
                          _controller.fixturesList[index].teams?.home?.name ??
                              "Ipswich Town",
                      awayTeamName:
                          _controller.fixturesList[index].teams?.away?.name ??
                              "Everton",
                      homeTeamFlagUrl:
                          _controller.fixturesList[index].teams?.home?.logo ??
                              "https://crests.football-data.org/349.png",
                      utcTime: _controller.fixturesList[index].fixture?.date ??
                          "2024-10-19T14:00:00Z",
                      awayTeamFlagUrl:
                          _controller.fixturesList[index].teams?.away?.logo ??
                              "https://crests.football-data.org/62.png",
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.grey.shade400,
                width: 1.0,
              ),
            ),
            child: InkWell(
              onTap: () {},
              child: InkWell(
                onTap: () {
                  Get.off(const Fixtures());
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('View all fixtures'.tr),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.arrow_right_alt),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget standingsTab() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Center(
                child: Text(
                  'League Table',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            //Text('League Table'),
            // if touch league table button
          ),
          standings(),
          InkWell(
            onTap: () {
              Get.to(
                  Standings(standingsData: _controller.standingsList.toList()));
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.grey.shade400,
                    width: 1.0,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('View full table'.tr),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.arrow_right_alt),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget standingsRow({
    required int position,
    required String crest,
    required String shortName,
    required int playedGames,
    required int goalDifference,
    required int points,
    int? goalsFor,
    int? goalsAgainst,
    int? won,
    int? draw,
    int? lost,
  }) {
    int positionFlex = 1;
    int clubRowFlex = 5;
    int crestFlex = 1;
    int shortNameFlex = 4;
    int playedGamesFlex = 1;
    int wonFlex = 1;
    int drawFlex = 1;
    int lostFlex = 1;
    int goalDifferenceFlex = 1;
    int pointsFlex = 1;
    double headerSize = 11.sp;

    return Column(
      children: [
        if (position == 1)
          Container(
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: Row(
                children: [
                  Expanded(
                    flex: positionFlex,
                    child: safeText(
                      text: 'Pos',
                      fontSize: headerSize,
                    ),
                  ),
                  Expanded(
                    flex: clubRowFlex,
                    child: safeText(
                      text: 'Club',
                      fontSize: headerSize,
                    ),
                  ),
                  Expanded(
                    flex: playedGamesFlex,
                    child: Center(
                        child: safeText(
                      text: 'Pl',
                      fontSize: headerSize,
                    )),
                  ),
                  Expanded(
                    flex: wonFlex,
                    child: Center(
                        child: safeText(
                      text: 'W',
                      fontSize: headerSize,
                    )),
                  ),
                  Expanded(
                    flex: drawFlex,
                    child: Center(
                        child: safeText(
                      text: 'D',
                      fontSize: headerSize,
                    )),
                  ),
                  Expanded(
                    flex: lostFlex,
                    child: Center(
                        child: safeText(
                      text: 'L',
                      fontSize: headerSize,
                    )),
                  ),
                  Expanded(
                    flex: goalDifferenceFlex,
                    child: Center(
                        child: safeText(
                      text: 'GD',
                      fontSize: headerSize,
                    )),
                  ),
                  Expanded(
                    flex: pointsFlex,
                    child: Center(
                        child: safeText(
                      text: 'Pts',
                      fontSize: headerSize,
                    )),
                  ),
                ],
              ),
            ),
          ),
        Row(
          children: [
            Expanded(
              flex: positionFlex,
              child: safeText(text: '$position'),
            ),
            Expanded(
              flex: clubRowFlex,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: crestFlex,
                    child: Center(
                      child: loadImages(
                        imageUrl: crest,
                        height: 30.h,
                        width: 30.w,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: shortNameFlex,
                    child: safeText(text: shortName),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: playedGamesFlex,
              child: Center(child: safeText(text: '$playedGames')),
            ),
            if (won != null)
              Expanded(
                flex: wonFlex,
                child: Center(child: safeText(text: '$won')),
              ),
            if (draw != null)
              Expanded(
                flex: drawFlex,
                child: Center(child: safeText(text: '$draw')),
              ),
            if (lost != null)
              Expanded(
                flex: lostFlex,
                child: Center(child: safeText(text: '$lost')),
              ),
            Expanded(
              flex: goalDifferenceFlex,
              child: Center(
                  child: safeText(
                      text: (goalDifference > 0)
                          ? '+$goalDifference'
                          : '$goalDifference')),
            ),
            Expanded(
              flex: pointsFlex,
              child: Center(child: safeText(text: '$points')),
            ),
          ],
        ),
        Divider(
          color: Colors.grey.shade500,
          thickness: 1.0,
          height: 16.0,
        ),
      ],
    );
  }

  Widget standings() {
    return Obx(
      () => ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _controller.shortList.toList().length,
          itemBuilder: (context, index) {
            final basePath = _controller.shortList;
            int position = basePath[index].position ?? 0;
            String shortName = basePath[index].team?.shortName ?? '';
            String crest = basePath[index].team?.crest ?? '';
            int playedGames = basePath[index].playedGames ?? 0;
            int goalDifference = basePath[index].goalDifference ?? 0;
            int points = basePath[index].points ?? 0;
            int won = basePath[index].won ?? 0;
            int draw = basePath[index].draw ?? 0;
            int lost = basePath[index].lost ?? 0;
            int goalsFor = basePath[index].goalsFor ?? 0;
            int goalsAgainst = basePath[index].goalsAgainst ?? 0;

            return standingsRow(
              position: position,
              crest: crest,
              shortName: shortName,
              playedGames: playedGames,
              goalDifference: goalDifference,
              points: points,
              won: won,
              draw: draw,
              lost: lost,
              goalsFor: goalsFor,
              goalsAgainst: goalsAgainst,
            );
          }),
    );
  }

  int getLocalDay(String utcString) {
    DateTime utcTime = DateTime.parse(utcString);
    DateTime localTime = utcTime.toLocal();
    return localTime.day;
  }
}
