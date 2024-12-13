import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mynewapp/images_assets.dart';
import 'package:mynewapp/tab_content_base.dart';
import 'package:mynewapp/tabview_base.dart';
import 'package:mynewapp/teams_detail/fotorg_teams_detail_model.dart';
import 'package:mynewapp/teams_detail/teams_detail_controller.dart';

import '../common_resources.dart';

class TeamsDetail extends StatefulWidget {
  const TeamsDetail({
    super.key,
    this.clubColor = Colors.blue,
    this.clubName = '',
    this.clubCrest = '',
  });
  final Color clubColor;
  final String clubName;
  final String clubCrest;

  @override
  State<TeamsDetail> createState() => _TeamsDetailState();
}

class _TeamsDetailState extends State<TeamsDetail> {
  late TeamsInfoController _controller;

  @override
  void initState() {
    _controller = Get.put(TeamsInfoController());
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
          iconTheme: IconThemeData(
              color: (widget.clubColor != Colors.white) ? Colors.white : null),
          title: safeText(
            text: widget.clubName,
            color: (widget.clubColor != Colors.white) ? Colors.white : null,
            fontSize: 21.sp,
          ),
          backgroundColor: themeColor(),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(90.h),
            child: teamsHeader(
              widget.clubCrest,
              "Club".tr,
              widget.clubName,
              themeColor(),
            ),
          ),
        ),
        body: TabBase(
          tabBarColor: themeColor(),
          tabTitleList: ['Overview'.tr, 'Squad'.tr],
          tabs: [
            commonInfo(),
            squadInfo(),
          ],
        ),
      ),
    );
  }

  Widget commonInfo() {
    return TabContentBase(
      body: SingleChildScrollView(
        child: Obx(
          (){
            //isloading and isError
            return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: infoBlock(
                  title: 'Club Details'.tr,
                  content: Column(
                    children: [
                      infoRow(
                        labelSize: 18.sp,
                        label: 'Nation'.tr,
                        content: Wrap(
                          children: [
                            loadImages(
                              imageUrl: _controller.teamData.value.area?.flag ??
                                  "https://crests.football-data.org/770.svg",
                              height: 30,
                              width: 40,
                            ),
                            SizedBox(
                              width: 5.0.w,
                            ),
                            safeText(
                              text: _controller.teamData.value.area?.name ??
                                  'England',
                              fontSize: 17.sp,
                              isBold: true,
                            )
                          ],
                        ),
                      ),
                      infoRow(
                        labelSize: 17.sp,
                        label: 'Founded'.tr,
                        text: '${_controller.teamData.value.founded}',
                      ),
                      infoRow(
                        labelSize: 17.sp,
                        label: 'Address'.tr,
                        content: safeText(
                          maxLines: 2,
                          text: _controller.teamData.value.address ??
                              "Sir Matt Busby Way Manchester M16 ORA",
                          fontSize: 17.sp,
                          isBold: true,
                        ),
                      ),
                      infoRow(
                        label: 'Venue'.tr,
                        labelSize: 17.sp,
                        text: _controller.teamData.value.venue,
                      ),
                      infoRow(
                          label: 'Club color'.tr,
                          labelSize: 17.sp,
                          text: _controller.teamData.value.clubColors)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: infoBlock(
                  title: 'Coach'.tr,
                  content: Column(
                    children: [
                      infoRow(
                        labelSize: 17.sp,
                        label: 'Name'.tr,
                        text: _controller.teamData.value.coach?.name,
                      ),
                      infoRow(
                        labelSize: 17.sp,
                        label: 'Date of birth'.tr,
                        text: _controller.teamData.value.coach?.dateOfBirth,
                      ),
                      infoRow(
                        labelSize: 17.sp,
                        label: 'Nationality'.tr,
                        text: _controller.teamData.value.coach?.nationality,
                      ),
                    ],
                  ),
                ),
              ),
              infoContainer(
                title: 'Running competitions'.tr,
                data: _controller.teamData.value.runningCompetitions ?? [],
              ),
            ],
          );}
        ),
      ),
    );
  }

  Widget squadInfo() {
    return TabContentBase(
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: infoBlock(
                  title: 'Goalkeeper'.tr,
                  content: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _controller.goalKeepers.toList().length,
                    itemBuilder: (context, index) {
                      return infoImageRow(
                        imageUrl: _controller.goalKeepers[index].photo ?? '',
                        label: _controller.goalKeepers[index].name ?? '',
                        otherInfo:
                            'No. ${_controller.goalKeepers[index].number ?? ''}',
                        isPlayer: true,
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: infoBlock(
                  title: "Defender".tr,
                  content: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _controller.defenders.toList().length,
                    itemBuilder: (context, index) {
                      return infoImageRow(
                        imageUrl: _controller.defenders[index].photo ?? '',
                        label: _controller.defenders[index].name ?? '',
                        otherInfo:
                            'No. ${_controller.defenders[index].number ?? ''}',
                        isPlayer: true,
                      );
                    },
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: infoBlock(
                  title: "Midfielder".tr,
                  content: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _controller.midfielder.toList().length,
                    itemBuilder: (context, index) {
                      return infoImageRow(
                        imageUrl: _controller.midfielder[index].photo ?? '',
                        label: _controller.midfielder[index].name ?? '',
                        otherInfo:
                            'No. ${_controller.midfielder[index].number ?? ''}',
                        isPlayer: true,
                      );
                    },
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: infoBlock(
                  title: "Attacker".tr,
                  content: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _controller.attackers.toList().length,
                    itemBuilder: (context, index) {
                      return infoImageRow(
                        imageUrl: _controller.attackers[index].photo ?? '',
                        label: _controller.attackers[index].name ?? '',
                        otherInfo:
                            'No. ${_controller.attackers[index].number ?? ''}',
                        isPlayer: true,
                      );
                    },
                  ),

                ),
              ),
              SizedBox(
                height: 100.h,
              ),
            ],
          ),
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
                  fontSize: 22.sp,
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
    required List<RunningCompetitions> data,
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
                    imageUrl: data[index].emblem ?? '',
                    label: data[index].name ?? '',
                    otherInfo: data[index].type ?? '',
                  );
                }),
          ],
        ),
      ),
    );
  }

  Widget infoImageRow({
    required String imageUrl,
    required String label,
    required String otherInfo,
    bool hasDivider = false,
    bool isPlayer = false,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              loadImages(
                imageUrl: imageUrl,
                height: 40.h,
                width: 40.w,
                errorWidget: (isPlayer == true)
                    ? const Icon(Icons.person)
                    : Image.asset(ImagesAssets.cup),
              ),
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

  Color themeColor() {
    return Color.alphaBlend(Colors.black.withOpacity(0.1), widget.clubColor);
  }
}
