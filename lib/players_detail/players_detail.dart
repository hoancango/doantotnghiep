import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mynewapp/common_resources.dart';
import 'package:mynewapp/players_detail/players_detail_controller.dart';
import 'package:mynewapp/tab_content_base.dart';
import 'package:mynewapp/tabview_base.dart';

class PlayersDetail extends StatefulWidget {
  const PlayersDetail({super.key, this.color = Colors.red, this.clubName = '', this.clubCrest = '', this.playerName = '', this.playerImage = ''});
  final Color color;
  final String clubName;
  final String clubCrest;
  final String playerName;
  final String playerImage;

  @override
  State<PlayersDetail> createState() => _PlayersDetailState();
}

class _PlayersDetailState extends State<PlayersDetail> {
  late PlayersInfoController _controller;

  @override
  void initState() {
    _controller = Get.put(PlayersInfoController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: safeText(text: widget.playerName, color: Colors.white),
        backgroundColor:
            Color.alphaBlend(Colors.black.withOpacity(0.5), widget.color),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(90.h),
          child: playersHeader(
            widget.playerImage,
            widget.clubCrest,
            widget.playerName,
            widget.clubName,
            Color.alphaBlend(Colors.black.withOpacity(0.5), widget.color),
          ),
        ),
      ),
      body: TabBase(
        tabTitleList: ['Hồ sơ', 'Thông số'],
        tabs: [
          Obx(() => (_controller.isLoading.value == true)
              ? const Center(child: CircularProgressIndicator())
              : generalInfo()),
          Obx(() => (_controller.isLoading.value == true)
              ? const Center(child: CircularProgressIndicator())
              : statsInfo()),
        ],
        tabBarColor:
            Color.alphaBlend(Colors.black.withOpacity(0.5), widget.color),
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
                      text: _controller.playerData.value?.player?.firstname ??
                          'Rodrigo',
                    ),
                    infoRow(
                      label: 'Last Name',
                      text: _controller.playerData.value?.player?.lastname ??
                          "Hernández Cascante",
                    ),
                    infoRow(
                      label: 'Age',
                      text: '${_controller.playerData.value?.player?.age}',
                    ),
                    infoRow(
                      label: 'Nationality',
                      text: _controller.playerData.value?.player?.nationality ??
                          'Spain',
                    ),
                    infoRow(
                      label: 'Date of birth',
                      text: _controller.playerData.value?.player?.birth?.date ??
                          "1996-06-22",
                    ),
                    infoRow(
                      label: "Place",
                      text:
                          _controller.playerData.value?.player?.birth?.place ??
                              'Madrid',
                    ),
                    infoRow(
                      label: "Height",
                      text: _controller.playerData.value?.player?.height ??
                          "190 cm",
                    ),
                    infoRow(
                      label: "Weight",
                      text: _controller.playerData.value?.player?.height ??
                          "82 kg",
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: infoBlock(
                title: 'Running Competitions',
                content: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _controller.playerData.value?.statistics?.length,
                    itemBuilder: (context, index) {
                      final basePath =
                          _controller.playerData.value?.statistics?[index];
                      return infoImageRow(
                        imageUrl: basePath?.league?.logo ?? '',
                        label: basePath?.league?.name ?? "",
                        otherInfo: basePath?.league?.country ?? "",
                        imageHeight: 40.h,
                        imageWidth: 40.w,
                      );
                    }),
                // Column(
                //   children: [
                //     infoImageRow(
                //       imageUrl: 'null',
                //       label: "FIFA Club World Cup",
                //       otherInfo: "CUP",
                //       imageHeight: 40.h,
                //       imageWidth: 40.w,
                //     ),
                //     infoImageRow(
                //       imageUrl: "https://crests.football-data.org/PL.png",
                //       label: 'Premier League',
                //       otherInfo: 'LEAGUE',
                //       imageHeight: 40.h,
                //       imageWidth: 40.w,
                //     ),
                //     infoImageRow(
                //       imageUrl: "https://crests.football-data.org/CL.png",
                //       label: "UEFA Champions League",
                //       otherInfo: 'CUP',
                //       imageHeight: 40.h,
                //       imageWidth: 40.w,
                //     ),
                //   ],
                // ),
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
    final basePath = _controller
        .playerData.value?.statistics?[_controller.selectedIndex.value];
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
                  border: commonBorder(),
                  content: Column(
                    children: [
                      infoRow(
                          label: 'Appearances',
                          text: '${basePath?.games?.appearences ?? '_'}'),
                      infoRow(
                          label: 'Lineup',
                          text: '${basePath?.games?.lineups ?? '_'}'),
                      infoRow(
                          label: 'Minutes',
                          text: '${basePath?.games?.minutes ?? '_'}'),
                      infoRow(
                          label: 'Position',
                          text: basePath?.games?.position ?? "_"),
                      infoRow(
                          label: 'Rating',
                          text: basePath?.games?.rating ?? '_'),
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
                      infoRow(
                          label: 'Goals',
                          text: '${basePath?.goals?.total ?? '_'}'),
                      infoRow(
                        label: 'Shots',
                        text: '${basePath?.shots?.total ?? '_'}',
                      ),
                      infoRow(
                          label: 'Shots on target',
                          text: '${basePath?.shots?.on ?? '_'}'),
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
                      infoRow(
                          label: 'Assists',
                          text: '${basePath?.goals?.assists ?? '_'}'),
                      infoRow(
                          label: 'Passes',
                          text: '${basePath?.passes?.total ?? '_'}'),
                      infoRow(
                        label: 'Key pass',
                        text: '${basePath?.passes?.key ?? '_'}',
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
                      infoRow(
                          label: 'Yellow Cards',
                          text: '${basePath?.cards?.yellow ?? '_'}'),
                      infoRow(
                          label: 'Red Cards(2nd Yellow)',
                          text: '${basePath?.cards?.yellowred ?? '_'}'),
                      infoRow(
                          label: 'Red Cards',
                          text: '${basePath?.cards?.red ?? '_'}'),
                      infoRow(
                          label: 'Committed',
                          text: '${basePath?.fouls?.committed ?? '_'}'),
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
                      infoRow(
                          label: 'In',
                          text: '${basePath?.substitutes?.subIn ?? '_'}'),
                      infoRow(
                          label: 'Out',
                          text: '${basePath?.substitutes?.subOut ?? '_'}'),
                      infoRow(
                          label: 'Bench',
                          text: '${basePath?.substitutes?.bench ?? '_'}'),
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
              initialIndex: 0,
              addImageData: _controller.imageLeagues,
              dropDownData: _controller.leaguesNames,
              onValueChanged: (index) {
                _controller.selectedIndex.value = index;
              },
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
      color: widget.color,
      width: 4.0,
    ));
  }

  Color themeColor(){
    return Color.alphaBlend(Colors.black.withOpacity(0.1), widget.color);
  }
}


