import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mynewapp/base_screen.dart';
import 'package:mynewapp/common_resources.dart';
import 'package:mynewapp/custom_tab_bar.dart';
import 'package:mynewapp/matches_detail/matches_detail.dart';
import 'package:mynewapp/news_detail/detailNews.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _LatestState();
}

class _LatestState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      label: 'Tổng hợp',
      appBar: AppBar(
        title: safeText(text: 'Tổng hợp', color: Colors.white),
        backgroundColor: Color.alphaBlend(
            Colors.black.withOpacity(0.5), Colors.purple.shade700),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.alphaBlend(
                      Colors.black.withOpacity(0.5), Colors.purple.shade700),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          loadImages(
                            imageUrl:
                                'https://img2.thejournal.ie/article/6509629/river/?height=400&version=6509572',
                            height: 300,
                            width: MediaQuery.sizeOf(context).width,
                            circularRadius: 10,
                          ),
                          Text(
                            'Ưu tiên',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Former Liverpool boss Jurgen Klopp lands new role as Red Bull’s global head of soccer',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'The 57-year-old German will join Red Bull on 1 January, overseeing the company’s network of clubs.',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          getNews(
                              imageUrl:
                                  'https://static.bangkokpost.com/media/content/20241009/c1_2880663_700.jpg',
                              type: 'Ưu tiên',
                              title:
                                  'Red Bull hires Juergen Klopp as head of global soccer',
                              description:
                                  'Juergen Klopp is joining Red Bull as its &ldquo;head of global soccer&rdquo;, less than six months after stepping down as the coach of the English Premier League club Liverpool FC.'),
                          getNews(
                              imageUrl:
                                  "https://untold-arsenal.com/wp-content/uploads/2023/07/Football-should-be-an-art.jpg",
                              type: 'Nổi bật',
                              title:
                                  'The key points we will be putting to the Football Regulator on Day 1',
                              description:
                                  'The battle lines are drawn, but the Premier League has the winning hand. ManC case against League leaves League free to make two minor amendments By Tony Attwood It is being said in political circles that the bill to introduce the Football Regulator into Engl…'),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      moreNews(
                          title:
                              'The key points we will be putting to the Football Regulator on Day 1'),
                      moreNews(
                          title:
                              'Ted Lasso Blu-Ray Box Set Gets Significant Price Cut For Prime Big Deal Days'),
                      moreNews(
                          title:
                              'Jack Taylor excited by the prospect of winning first Ireland cap'),
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
                  height: 400.h,
                  tabs: ['Matches', 'League Table'],
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
                          child: Text(
                            'Man Utd News',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      otherNews(
                        favImageUrl:
                            "https://cdn.mos.cms.futurecdn.net/L8tK8cm8NRPdwNYw9PH5sA-1200-80.jpg",
                        title:
                            "‘Liverpool did the same thing to Arsenal in 2001 that Manchester United did to us at Bayern in 1999 – in two moments, we changed the game in our favour’: German defender recalls dramatic FA Cup final victory at the Millennium Stadium",
                      ),
                      otherNews(
                        favImageUrl:
                            "https://ichef.bbci.co.uk/news/1024/branded_sport/a111/live/83419ef0-871a-11ef-a3e8-b9f29f911fa2.jpg",
                        title:
                            "'Why not aim for Champions League?' Liverpool's Bonner",
                      ),
                      otherNews(
                        favImageUrl:
                            "https://ichef.bbci.co.uk/ace/standard/1024/cpsprodpb/0adb/live/4a04a790-87c9-11ef-b6b0-c9af5f7f16e4.jpg",
                        title: "Rooney reflects on pictures from his career",
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Tin mới nhất',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      otherNews(
                        favImageUrl:
                            "https://cdn.vox-cdn.com/thumbor/2YQTIGYCTgHgJhj6sWWiwUF1ZEw=/0x247:5138x2937/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/25670786/2176189832.jpg",
                        title:
                            "Everton Women vs West Ham United: WSL Match Preview",
                      ),
                      otherNews(
                        favImageUrl:
                            "https://www.americanbankingnews.com/wp-content/timthumb/timthumb.php?src=https://www.marketbeat.com/logos/kb-home-logo-1200x675.png&w=240&h=240&zc=2",
                        title:
                            "FY2024 Earnings Forecast for KB Home (NYSE:KBH) Issued By Zacks Research",
                      ),
                      otherNews(
                        favImageUrl:
                            "https://focus.independent.ie/thumbor/ZhBM2PoIUktnLguQk_6p-y24zXQ=/629x460/smart/prod-mh-ireland/e0dca258-f1c0-4dd3-8c89-3967d9dbca35/28289532-5f7f-4b8f-93e3-8de32aa251ed/GettyImages_1250538383.jpg",
                        title:
                            "Letters: As election time looms, pensioners will not forget Budget 2025",
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
        ),
      ),
    );
  }

  Widget getNews(
      {required String imageUrl,
      required String type,
      required String title,
      required String description}) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {
          Get.to(DetailNews(
              newsTitle: title, imageUrl: imageUrl, content: description));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              loadImages(
                imageUrl: imageUrl,
                height: 150,
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

  Widget moreNews({required String title}) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
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
    );
  }

  Widget otherNews({
    required String favImageUrl,
    required String title,
  }) {
    return Row(
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
            maxLines: 3,
          ),
        ),
      ],
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
                child: Text(
                  'Matchweek 8',
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
          Text('Thời gian hiển thị theo khu vực của bạn'),
          Text('Thứ 7 ngày 19 tháng 10'),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              InkWell(
                onTap: () {
                  Get.to(const MatchesDetail());
                },
                child: getMatches(
                  homeTeamName: 'Tottenham',
                  awayTeamName: 'West Ham',
                  homeTeamFlagUrl: "https://crests.football-data.org/73.png",
                  utcTime: "2024-10-19T11:30:00Z",
                  awayTeamFlagUrl: "https://crests.football-data.org/563.png",
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(const MatchesDetail());
                },
                child: getMatches(
                  homeTeamName: "Fulham",
                  awayTeamName: "Aston Villa",
                  homeTeamFlagUrl: "https://crests.football-data.org/63.png",
                  utcTime: "2024-10-19T14:00:00Z",
                  awayTeamFlagUrl: "https://crests.football-data.org/58.png",
                ),
              ),
              getMatches(
                homeTeamName: "Ipswich Town",
                awayTeamName: "Everton",
                homeTeamFlagUrl: "https://crests.football-data.org/349.png",
                utcTime: "2024-10-19T14:00:00Z",
                awayTeamFlagUrl: "https://crests.football-data.org/62.png",
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.grey.shade400,
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Xem đầy đủ số trận'),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.arrow_right_alt),
                ],
              ),
            ),
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
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Center(child: Text('Xếp hạng')),
              ),
              Expanded(
                flex: 2,
                child: Text('CLB'),
              ),
              Expanded(
                flex: 1,
                child: Center(child: Text('Số trận')),
              ),
              Expanded(
                flex: 1,
                child: Center(child: Text('Hiệu số')),
              ),
              Expanded(
                flex: 1,
                child: Center(child: Text('Điểm')),
              ),
            ],
          ),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              standingsRow(
                position: 1,
                crest: 'https://crests.football-data.org/64.png',
                shortName: 'Liverpool',
                playedGames: 7,
                goalDifference: 11,
                points: 18,
              ),
              standingsRow(
                position: 2,
                crest: "https://crests.football-data.org/65.png",
                shortName: 'Man City',
                playedGames: 7,
                goalDifference: 9,
                points: 17,
              ),
              standingsRow(
                position: 3,
                crest: "https://crests.football-data.org/57.png",
                shortName: "Arsenal",
                playedGames: 7,
                goalDifference: 9,
                points: 17,
              ),
            ],
          ),
          Container(
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
                  Text('View full table'),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.arrow_right_alt),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
