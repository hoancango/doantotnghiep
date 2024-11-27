import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynewapp/base_screen.dart';
import 'package:mynewapp/common_resources.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(
        title: safeText(text: 'Cài đặt', color: Colors.white),
        backgroundColor: commonColor(),
      ),
      label: 'Cài đặt',
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // height: 50.h,
              // child: Row(
              //   children: [
              //     Expanded(
              //       flex: 1,
              //       child: Icon(Icons.light_mode),
              //     ),
              //     Expanded(
              //       flex: 4,
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text('Chế độ'),
              //           Text('Sáng'),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
