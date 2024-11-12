import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mynewapp/base_screen.dart';
import 'package:mynewapp/common_resources.dart';
import 'package:mynewapp/players_detail/players_detail.dart';
import 'package:mynewapp/tabview_base.dart';
import 'package:mynewapp/teams_detail/teams_detail.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite>
    with SingleTickerProviderStateMixin {
  RxList<Map<String, dynamic>> favTeams = [
    {
      'teamName': "Man City",
      'teamImage':
          "https://tmssl.akamaized.net//images/wappen/medium/281.png?lm=1467356331",
      'mktValue': "€1.26bn",
      'teamColor': Colors.lightBlue,
    },
    {
      'teamName': "Man Utd",
      'teamImage':
          "https://tmssl.akamaized.net//images/wappen/medium/985.png?lm=1457975903",
      'mktValue': "€854.15m",
      'teamColor': Colors.red,
    },
    {
      'teamName': "Real Madrid",
      'teamImage':
          "https://tmssl.akamaized.net//images/wappen/medium/418.png?lm=1729684474",
      'mktValue': "€1.36bn",
      'teamColor': Colors.yellow,
    },
  ].obs;

  RxList<Map<String, dynamic>> favPlayers = [
    {
      'playerName': "Rodri",
      'playerImage':
          "https://img.a.transfermarkt.technology/portrait/medium/357565-1682587890.jpg?lm=1",
      'mktValue': "€130.00m",
      'teamColor': Colors.lightBlue,
      'teamImage':
          "https://tmssl.akamaized.net//images/wappen/medium/281.png?lm=1467356331",
    },
    {
      'playerName': "Trent Alexander-Arnold",
      'playerImage':
          "https://img.a.transfermarkt.technology/portrait/medium/314353-1701680958.jpg?lm=1",
      'mktValue': "€70.00m",
      'teamColor': Colors.red,
      'teamImage':
          "https://tmssl.akamaized.net//images/wappen/medium/31.png?lm=1727873452",
    },
    {
      'playerName': "F. Valverde",
      'playerImage':
          "https://img.a.transfermarkt.technology/portrait/medium/369081-1681999815.jpg?lm=1",
      'mktValue': "€130.00m",
      'teamColor': Colors.yellow,
      'teamImage':
          "https://tmssl.akamaized.net//images/wappen/medium/418.png?lm=1729684474",
    },
  ].obs;

  List<Map<String, dynamic>> topValueTeams = [
    {
      "number": 1,
      "id": "418",
      "countryName": "Spain",
      "countryImage":
          "https://tmssl.akamaized.net//images/flagge/verysmall/157.png?lm=1520611569",
      "competitionID": "ES1",
      "competitionName": "LaLiga",
      "clubName": "Real Madrid",
      "clubImage":
          "https://tmssl.akamaized.net//images/wappen/medium/418.png?lm=1729684474",
      "avgAge": "27.11",
      "marketValue": "1.36",
      "marketValueCurrency": "€",
      "marketValueNumeral": "bn",
      "marketValueUnformatted": 1359000000,
      "progression": 1
    },
    {
      "number": 2,
      "id": "281",
      "countryName": "England",
      "countryImage":
          "https://tmssl.akamaized.net//images/flagge/verysmall/189.png?lm=1520611569",
      "competitionID": "GB1",
      "competitionName": "Premier League",
      "clubName": "Man City",
      "clubImage":
          "https://tmssl.akamaized.net//images/wappen/medium/281.png?lm=1467356331",
      "avgAge": "27.71",
      "marketValue": "1.26",
      "marketValueCurrency": "€",
      "marketValueNumeral": "bn",
      "marketValueUnformatted": 1263200000,
      "progression": -1
    },
    {
      "number": 3,
      "id": "11",
      "countryName": "England",
      "countryImage":
          "https://tmssl.akamaized.net//images/flagge/verysmall/189.png?lm=1520611569",
      "competitionID": "GB1",
      "competitionName": "Premier League",
      "clubName": "Arsenal",
      "clubImage":
          "https://tmssl.akamaized.net//images/wappen/medium/11.png?lm=1489787850",
      "avgAge": "26.38",
      "marketValue": "1.17",
      "marketValueCurrency": "€",
      "marketValueNumeral": "bn",
      "marketValueUnformatted": 1167500000,
      "progression": -1
    },
    {
      "number": 4,
      "id": "631",
      "countryName": "England",
      "countryImage":
          "https://tmssl.akamaized.net//images/flagge/verysmall/189.png?lm=1520611569",
      "competitionID": "GB1",
      "competitionName": "Premier League",
      "clubName": "Chelsea",
      "clubImage":
          "https://tmssl.akamaized.net//images/wappen/medium/631.png?lm=1682435911",
      "avgAge": "24.05",
      "marketValue": "954.20",
      "marketValueCurrency": "€",
      "marketValueNumeral": "m",
      "marketValueUnformatted": 954200000,
      "progression": 1
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      label: 'Theo dõi',
      appBar: AppBar(
        title: safeText(text: 'Theo dõi', color: Colors.white),
        backgroundColor: commonColor(),
      ),
      body: TabBase(
        tabBarColor: commonColor(),
        tabTitleList: ['Đội bóng', 'Cầu thủ'],
        tabs: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Obx(
                    () => GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: favTeams.toList().length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.h,
                        crossAxisSpacing: 10.w,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(const TeamsDetail());
                          },
                          child: favouriteWidget(
                              name: favTeams.toList()[index]['teamName'],
                              image: favTeams.toList()[index]['teamImage'],
                              mktValue: favTeams.toList()[index]['mktValue'],
                              teamColor: favTeams.toList()[index]['teamColor']),
                        );
                      },
                    ),
                  ),

                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemCount: topValueTeams.length,
                  //     itemBuilder: (context, index){
                  //     return topValue(topValueTeams[index]["clubImage"], topValueTeams[index]["clubName"], index);
                  //     },
                  // ),

                  SizedBox(
                    height: 100.h,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Obx(
                    () => GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: favTeams.toList().length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.h,
                        crossAxisSpacing: 10.w,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(const PlayersDetail());
                          },
                          child: favouriteWidget(
                            name: favPlayers.toList()[index]['playerName'],
                            image: favPlayers.toList()[index]['playerImage'],
                            mktValue: favPlayers.toList()[index]['mktValue'],
                            teamColor: favPlayers.toList()[index]['teamColor'],
                            playerTeamsImage: favPlayers.toList()[index]
                                ['teamImage'],
                          ),
                        );
                      },
                    ),
                  ),

                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemCount: topValueTeams.length,
                  //     itemBuilder: (context, index){
                  //     return topValue(topValueTeams[index]["clubImage"], topValueTeams[index]["clubName"], index);
                  //     },
                  // ),

                  SizedBox(
                    height: 100.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget favouriteWidget(
      {required String name,
      required String image,
      required String mktValue,
      required Color teamColor,
      String? playerTeamsImage}) {
    return Container(
      decoration: BoxDecoration(
          color: Color.alphaBlend(
            Colors.black.withOpacity(0.1),
            teamColor,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                loadImages(
                  imageUrl: image,
                  height: 50.h,
                  width: 45.w,
                ),
                if (playerTeamsImage != null)
                  loadImages(
                    imageUrl: playerTeamsImage,
                    height: 45,
                    width: 40,
                  ),
              ],
            ),
            safeText(
              text: name,
              fontSize: 17.sp,
              isBold: true,
              color: Colors.white,
            ),
            SizedBox(
              height: 7.h,
            ),
            safeText(
              text: '\$ Market value',
              color: Colors.white,
              fontSize: 14.sp,
            ),
            safeText(
              text: mktValue,
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ],
        ),
      ),
    );
  }

  Widget topValue(String imageUrl, String name, int index) {
    RxString label = 'Theo dõi'.obs;
    String mktValue =
        '${topValueTeams[index]["marketValueCurrency"]}${topValueTeams[index]["marketValue"]}${topValueTeams[index]["marketValueNumeral"]}';
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          loadImages(
            imageUrl: imageUrl,
            height: 30.h,
            width: 30.w,
            circularRadius: 10,
          ),
          safeText(
            text: name,
          ),
          InkWell(
            onTap: () {
              (label.value == 'Theo dõi')
                  ? label.value = 'Đang theo dõi'
                  : label.value = 'Theo dõi';
              // favTeams.add({
              //   'teamName': name,
              //   'teamImage':
              //   topValueTeams[index]["clubImage"],
              //   'mktValue': mktValue,
              //   'teamColor': Colors.grey.shade100,
              // });
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              child: safeText(text: label.value),
            ),
          ),
        ],
      ),
    );
  }
}
