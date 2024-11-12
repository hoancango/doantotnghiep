import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynewapp/tab_content_base.dart';
import 'package:mynewapp/tabview_base.dart';

import '../common_resources.dart';

class TeamsDetail extends StatefulWidget {
  const TeamsDetail({super.key});

  @override
  State<TeamsDetail> createState() => _TeamsDetailState();
}

class _TeamsDetailState extends State<TeamsDetail> {
  List<Map<String, dynamic>> competitions = [];

  @override
  void initState() {
    competitions = [
      {
        "name": "Premier League",
        "type": "LEAGUE",
        "emblem": "https://crests.football-data.org/PL.png"
      },
      {
        "name": "UEFA Europa League",
        "type": "CUP",
        "emblem": "https://crests.football-data.org/EL.png"
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: safeText(
          text: "Man United",
          color: Colors.white,
        ),
        backgroundColor: Colors.red.shade800,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(90.h),
          child: teamsHeader(
            "https://crests.football-data.org/66.png",
            "Club",
            "Manchester United FC",
            Colors.red.shade800,
          ),
        ),
      ),
      body: TabBase(
        tabBarColor: Colors.red.shade800,
        tabTitleList: ['Tổng quan', 'Đội hình'],
        tabs: [
          commonInfo(),
          squadInfo(),
        ],
      ),
    );
  }

  Widget commonInfo() {
    return TabContentBase(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: infoBlock(
                title: 'Club Detail',
                content: Column(
                  children: [
                    infoRow(
                      labelSize: 18.sp,
                      label: 'Nation',
                      content: Wrap(
                        children: [
                          loadImages(
                            imageUrl:
                                "https://crests.football-data.org/770.svg",
                            height: 30,
                            width: 40,
                          ),
                          SizedBox(
                            width: 5.0.w,
                          ),
                          safeText(
                            text: 'England',
                            fontSize: 17.sp,
                            isBold: true,
                          )
                        ],
                      ),
                    ),
                    infoRow(
                      labelSize: 17.sp,
                      label: 'Founded',
                      text: '1878',
                    ),
                    infoRow(
                      labelSize: 17.sp,
                      label: 'Address',
                      content: safeText(
                        maxLines: 2,
                        text: "Sir Matt Busby Way Manchester M16 ORA",
                        fontSize: 17.sp,
                        isBold: true,
                      ),
                    ),
                    infoRow(
                      label: 'Venue',
                      hasImage: false,
                      text: 'Old Trafford',
                    ),
                    infoRow(label: 'Club Color', text: 'Red / White')
                  ],
                ),
              ),
            ),

            infoBlock(title: 'Staff', content: Container()),

            infoContainer(
              title: 'Running Competitions',
              data: competitions,
            ),
          ],
        ),
      ),
    );
  }

  Widget squadInfo() {
    return TabContentBase(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: infoBlock(
                title: 'Goalkeeper',
                content: Column(
                  children: [
                    infoImageRow(
                      imageUrl:"https://media.api-sports.io/football/players/50132.png",
                      label:"A. Bayındır",
                      otherInfo:'No. 1',
                    ),
                    infoImageRow(
                      imageUrl:"https://media.api-sports.io/football/players/2931.png",
                      label:"T. Heaton",
                      otherInfo:'No. 22',
                    ),
                    infoImageRow(
                      imageUrl:"https://media.api-sports.io/football/players/526.png",
                      label:"A. Onana",
                      otherInfo:'No. 24',
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: infoBlock(
                title: "Defender",
                content: Column(
                  children: [
                    infoImageRow(
                      imageUrl:"https://media.api-sports.io/football/players/889.png",
                      label:"V. Lindelöf",
                      otherInfo:'No. 2',
                    ),
                    infoImageRow(
                      imageUrl:"https://media.api-sports.io/football/players/545.png",
                      label:"N. Mazraoui",
                      otherInfo:'No. 3',
                    ),
                    infoImageRow(
                      imageUrl:"https://media.api-sports.io/football/players/532.png",
                      label:"M. de Ligt",
                      otherInfo:'No. 4',
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: infoBlock(
                title: "Midfielder",
                content: Column(
                  children: [
                    infoImageRow(
                      imageUrl:"https://media.api-sports.io/football/players/19220.png",
                      label:"M. Mount",
                      otherInfo:'No. 7',
                    ),
                    infoImageRow(
                      imageUrl:"https://media.api-sports.io/football/players/1485.png",
                      label:"Bruno Fernandes",
                      otherInfo:'No. 8',
                    ),
                    infoImageRow(
                      imageUrl:"https://media.api-sports.io/football/players/174.png",
                      label:"C. Eriksen",
                      otherInfo:'No. 14',
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: infoBlock(
                title: "Attacker",
                content: Column(
                  children: [
                    infoImageRow(
                      imageUrl:"https://media.api-sports.io/football/players/288006.png",
                      label:"R. Højlund",
                      otherInfo:'No. 9',
                    ),
                    infoImageRow(
                      imageUrl:"https://media.api-sports.io/football/players/909.png",
                      label:"M. Rashford",
                      otherInfo:'No. 10',
                    ),
                    infoImageRow(
                      imageUrl:"https://media.api-sports.io/football/players/70100.png",
                      label:"J. Zirkzee",
                      otherInfo:'No. 11',
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 100.h,),
          ],
        ),
      ),
    );
  }

  Widget teamsHeader(
      String clubImage, String nationName, String clubName, Color? clubColors) {
    return Container(
      height: 90.h,
      decoration: BoxDecoration(color: clubColors),
      child: Row(
        children: [
          SizedBox(
            width: 10.0.w,
          ),
          loadImages(
            imageUrl: clubImage,
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
                  text: clubName,
                  fontSize: 20.sp,
                  color: (clubColors != Colors.white) ? Colors.white : null),
              safeText(
                text: nationName,
                color: (clubColors != Colors.white) ? Colors.white : null,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget infoContainer({
    required String title,
    required List<Map<String, dynamic>> data,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0.w),
          boxShadow: [
            commonShadow(),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: safeText(
                text: title,
                isBold: true,
                fontSize: 18.sp,
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return infoImageRow(
                    imageUrl: data[index]["emblem"],
                    label: data[index]["name"],
                    otherInfo: data[index]["type"],
                  );
                }),
          ],
        ),
      ),
    );
  }

  Widget infoImageRow(
      {required String imageUrl,
      required String label,
      required String otherInfo,
      bool hasDivider = false}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              loadImages(imageUrl: imageUrl, height: 40.h, width: 40.w,),
              SizedBox(
                width: 10.0.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  safeText(
                    text: label,
                    fontSize: 17.sp,
                  ),
                  safeText(
                    text: otherInfo,
                    color: Colors.grey,
                    fontSize: 12.sp,
                  ),
                ],
              )
            ],
          ),
        ),
        if (hasDivider == true)
          Divider(
            height: 1.0,
            thickness: 1.0,
            color: Colors.grey[300],
          ),
      ],
    );
  }
}
