import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynewapp/tabview_base.dart';

import '../common_resources.dart';

class CupsDetail extends StatefulWidget {
  const CupsDetail({super.key});

  @override
  State<CupsDetail> createState() => _CupsDetailState();
}

class _CupsDetailState extends State<CupsDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: safeText(
          text: "PL",
          color: Colors.white,
        ),
        backgroundColor: Colors.purple.shade600,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(90.h),
          child: teamsHeader("https://crests.football-data.org/66.png",
              "England", "Premier League", Colors.purple.shade600),
        ),
      ),
      body: TabBase(
        tabBarColor: Colors.purple.shade600,
        tabTitleList: ['Tổng quan','Thông số','Đội hình'],
        tabs: [
          Center(child: Text('Tổng quan'),),
          Center(child: Text('Thông số'),),
          Center(child: Text('Đội hình'),),
        ],
      ),
    );
  }

  // sửa sau
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
}
