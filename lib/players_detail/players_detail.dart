import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mynewapp/common_resources.dart';
import 'package:mynewapp/players_detail/players_detail_controller.dart';
import 'package:mynewapp/tab_content_base.dart';
import 'package:mynewapp/tabview_base.dart';

class PlayersDetail extends StatefulWidget {
  const PlayersDetail(
      {super.key,
      this.color = Colors.red,
      this.clubName = '',
      this.clubCrest = '',
      this.playerName = '',
      this.playerImage = '',
      required this.playerId});
  final Color color;
  final String clubName;
  final String clubCrest;
  final String playerName;
  final String playerImage;
  final int playerId;

  @override
  State<PlayersDetail> createState() => _PlayersDetailState();
}

class _PlayersDetailState extends State<PlayersDetail> {
  late PlayersInfoController _controller;

  @override
  void initState() {
    _controller = Get.put(PlayersInfoController(), permanent: true, tag: '${widget.playerId}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
          bodySmall: TextStyle(color: Colors.black),
        ),
      ),
      child: Scaffold(
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
          tabTitleList: ['Profile'.tr, 'Stats'.tr],
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
                title: 'Personal details'.tr,
                content: Column(
                  children: [
                    infoRow(
                      label: 'First name'.tr,
                      text: _controller.playerData.value?.player?.firstname ??
                          'Rodrigo',
                    ),
                    infoRow(
                      label: 'Last name'.tr,
                      text: _controller.playerData.value?.player?.lastname ??
                          "Hernández Cascante",
                    ),
                    infoRow(
                      label: 'Age'.tr,
                      text: '${_controller.playerData.value?.player?.age}',
                    ),
                    infoRow(
                      label: 'Nationality'.tr,
                      text: _controller.playerData.value?.player?.nationality ??
                          'Spain',
                    ),
                    infoRow(
                      label: 'Date of birth'.tr,
                      text: _controller.playerData.value?.player?.birth?.date ??
                          "1996-06-22",
                    ),
                    infoRow(
                      label: "Place".tr,
                      text:
                          _controller.playerData.value?.player?.birth?.place ??
                              'Madrid',
                    ),
                    infoRow(
                      label: "Height".tr,
                      text: _controller.playerData.value?.player?.height ??
                          "190 cm",
                    ),
                    infoRow(
                      label: "Weight".tr,
                      text: _controller.playerData.value?.player?.weight ??
                          "82 kg",
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: infoBlock(
                title: 'Running competitions'.tr,
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
                  title: 'Overview'.tr,
                  border: commonBorder(),
                  content: Column(
                    children: [
                      infoRow(
                          label: 'Appearances'.tr,
                          text: '${basePath?.games?.appearences ?? '_'}'),
                      infoRow(
                          label: 'Lineup'.tr,
                          text: '${basePath?.games?.lineups ?? '_'}'),
                      infoRow(
                          label: 'Minutes'.tr,
                          text: '${basePath?.games?.minutes ?? '_'}'),
                      infoRow(
                          label: 'Position'.tr,
                          text: basePath?.games?.position ?? "_"),
                      infoRow(
                          label: 'Rating'.tr,
                          text:
                              basePath?.games?.rating?.substring(0, 5) ?? '_'),
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
                          label: 'Goals'.tr,
                          text: '${basePath?.goals?.total ?? '_'}'),
                      infoRow(
                        label: 'Shots'.tr,
                        text: '${basePath?.shots?.total ?? '_'}',
                      ),
                      infoRow(
                          label: 'Shots on target'.tr,
                          text: '${basePath?.shots?.on ?? '_'}'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: infoBlock(
                  border: commonBorder(),
                  title: 'Team play'.tr,
                  content: Column(
                    children: [
                      infoRow(
                          label: 'Assists'.tr,
                          text: '${basePath?.goals?.assists ?? '_'}'),
                      infoRow(
                          label: 'Passes'.tr,
                          text: '${basePath?.passes?.total ?? '_'}'),
                      infoRow(
                        label: 'Key pass'.tr,
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
                  title: 'Discipline'.tr,
                  content: Column(
                    children: [
                      infoRow(
                          label: 'Yellow cards'.tr,
                          text: '${basePath?.cards?.yellow ?? '_'}'),
                      infoRow(
                          label: 'Red cards(2nd yellow)'.tr,
                          text: '${basePath?.cards?.yellowred ?? '_'}'),
                      infoRow(
                          label: 'Red cards'.tr,
                          text: '${basePath?.cards?.red ?? '_'}'),
                      infoRow(
                          label: 'Committed'.tr,
                          text: '${basePath?.fouls?.committed ?? '_'}'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: infoBlock(
                  border: commonBorder(),
                  title: 'Substitutes'.tr,
                  content: Column(
                    children: [
                      infoRow(
                          label: 'In'.tr,
                          text: '${basePath?.substitutes?.subIn ?? '_'}'),
                      infoRow(
                          label: 'Out'.tr,
                          text: '${basePath?.substitutes?.subOut ?? '_'}'),
                      infoRow(
                          label: 'Bench'.tr,
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

  Color themeColor() {
    return Color.alphaBlend(Colors.black.withOpacity(0.1), widget.color);
  }
}
