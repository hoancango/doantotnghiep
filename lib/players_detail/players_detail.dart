import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynewapp/common_resources.dart';
import 'package:mynewapp/tab_content_base.dart';
import 'package:mynewapp/tabview_base.dart';

class PlayersDetail extends StatefulWidget {
  const PlayersDetail({super.key});

  @override
  State<PlayersDetail> createState() => _PlayersDetailState();
}

class _PlayersDetailState extends State<PlayersDetail> {
  List<String> runningCups = [];
  List<String> imageCups = [];

  @override
  void initState() {
    runningCups = [
      "Premier League 2024/2025",
      "League Cup 2024/2025",
      "UEFA Champions League 2024/2025",
    ];
    imageCups = [
      "https://media.api-sports.io/football/leagues/39.png",
      "https://media.api-sports.io/football/leagues/48.png",
      "https://media.api-sports.io/football/leagues/2.png",
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: safeText(text: 'Rodri', color: Colors.white),
        backgroundColor: Colors.blue.shade600,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(90.h),
          child: playersHeader(
            "https://media.api-sports.io/football/players/44.png",
            "https://media.api-sports.io/football/teams/50.png",
            "Rodri",
            "Manchester City",
            Colors.blue.shade600,
          ),
        ),
      ),
      body: TabBase(
        tabTitleList: ['Hồ sơ', 'Thông số'],
        tabs: [
          generalInfo(),
          statsInfo(),
        ],
        tabBarColor: Colors.blue.shade600,
      ),
    );
  }

  Widget generalInfo() {
    return TabContentBase(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: infoBlock(
                title: 'Personal Detail',
                content: Column(
                  children: [
                    infoRow(
                      label: 'First Name',
                      text: 'Rodrigo',
                    ),
                    infoRow(
                      label: 'Last Name',
                      text: "Hernández Cascante",
                    ),
                    infoRow(
                      label: 'Nationality',
                      text: 'Spain',
                    ),
                    infoRow(
                      label: 'Date of birth',
                      text: "1996-06-22",
                    ),
                    infoRow(
                      label: "Place",
                      text: 'Madrid',
                    ),
                    infoRow(
                      label: "Height",
                      text: "190 cm",
                    ),
                    infoRow(
                      label: "Weight",
                      text: "82 kg",
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: infoBlock(
                title: 'Running Competitions',
                content: Column(
                  children: [
                    infoImageRow(
                      imageUrl: 'null',
                      label: "FIFA Club World Cup",
                      otherInfo: "CUP",
                      imageHeight: 40.h,
                      imageWidth: 40.w,
                    ),
                    infoImageRow(
                      imageUrl: "https://crests.football-data.org/PL.png",
                      label: 'Premier League',
                      otherInfo: 'LEAGUE',
                      imageHeight: 40.h,
                      imageWidth: 40.w,
                    ),
                    infoImageRow(
                      imageUrl: "https://crests.football-data.org/CL.png",
                      label: "UEFA Champions League",
                      otherInfo: 'CUP',
                      imageHeight: 40.h,
                      imageWidth: 40.w,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget statsInfo() {
    return TabContentBase(
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 70.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: infoBlock(
                  title: 'Overview',
                  border: Border(
                      top: BorderSide(
                    color: Colors.blue.shade600,
                    width: 4.0,
                  )),
                  content: Column(
                    children: [
                      infoRow(label: 'Appearances', text: '2'),
                      infoRow(label: 'Lineup', text: '1'),
                      infoRow(label: 'Minutes', text: '65'),
                      infoRow(label: 'Position', text: "Midfielder"),
                      infoRow(label: 'Rating', text: "7.100000"),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: infoBlock(
                  border: commonBorder(),
                  title: 'Attack',
                  content: Column(
                    children: [
                      infoRow(label: 'Goals', text: '0'),
                      infoRow(
                        label: 'Shots',
                        text: '_',
                      ),
                      infoRow(label: 'Shots on target', text: '_'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: infoBlock(
                  border: commonBorder(),
                  title: 'Team Play',
                  content: Column(
                    children: [
                      infoRow(label: 'Assists', text: '0'),
                      infoRow(label: 'Passes', text: '61'),
                      infoRow(
                        label: 'Key pass',
                        text: '1',
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: infoBlock(
                  border: commonBorder(),
                  title: 'Discipline',
                  content: Column(
                    children: [
                      infoRow(label: 'Yellow Cards', text: '0'),
                      infoRow(label: 'Red Cards(2nd Yellow)', text: '0'),
                      infoRow(label: 'Red Cards', text: '0'),
                      infoRow(label: 'Committed', text: '1'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: infoBlock(
                  border: commonBorder(),
                  title: 'Substitutes',
                  content: Column(
                    children: [
                      infoRow(label: 'In', text: '1'),
                      infoRow(label: 'Out', text: '1'),
                      infoRow(label: 'Bench', text: '2'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
            ],
          ),
        ),
        shadowContainer(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: globalDropDownBox(
              initialValue: runningCups[0],
              dropDownData: runningCups,
              addImageData: imageCups,
            ),
          ),
        ),
      ]),
    );
  }

  Widget playersHeader(String playerImage, String clubImage, String playerName,
      String clubName, Color? clubColors) {
    return Container(
      height: 90.h,
      child: Row(
        children: [
          SizedBox(
            width: 10.0.w,
          ),
          loadImages(
            imageUrl: playerImage,
            height: 50.h,
            width: 50.w,
            shape: BoxShape.circle,
          ),
          SizedBox(
            width: 5.0.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              safeText(
                  text: playerName,
                  fontSize: 20.sp,
                  color: (clubColors != Colors.white) ? Colors.white : null),
              Row(
                children: [
                  loadImages(imageUrl: clubImage, height: 20.h, width: 20.w),
                  safeText(
                    text: clubName,
                    color: (clubColors != Colors.white) ? Colors.white : null,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  BoxBorder commonBorder() {
    return Border(
        top: BorderSide(
      color: Colors.blue.shade600,
      width: 4.0,
    ));
  }
}
