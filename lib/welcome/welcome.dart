import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynewapp/base_screen.dart';
import 'package:mynewapp/common_data/common_data_org_teams.dart';
import 'package:mynewapp/common_resources.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              safeText(
                text: 'Welcome!',
                fontSize: 30.sp,
                isBold: true,
                color: Colors.white,
              ),
              SizedBox(
                height: 10.h,
              ),
              safeText(
                safeEnable: false,
                text:
                    'Help us tailor your experience by answering a few quick and easy questions',
                color: Colors.white,
                isBold: true,
              ),
              SizedBox(
                height: 10.h,
              ),
              button(
                text: 'Get started',
                color: Colors.white,
                height: 50.h,
                width: ScreenUtil().screenWidth,
              ),
              SizedBox(
                height: 10.h,
              ),
              safeText(
                text: 'If you already have an account',
                color: Colors.white,
                isBold: true,
              ),
              SizedBox(
                height: 10.h,
              ),
              button(
                text: 'Log in',
                color: commonColor(),
                textColor: Colors.white,
                height: 50.h,
                width: ScreenUtil().screenWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget button({
    required String text,
    Color? color,
    Color? textColor,
    double? height,
    double? width,
    bool isBold = false,
    void Function()? onTab,
  }) {
    return InkWell(
      onTap: onTab,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: safeText(
            text: text,
            color: textColor,
          ),
        )),
      ),
    );
  }
}




