import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynewapp/common_resources.dart';

class DetailNews extends StatefulWidget {
  const DetailNews(
      {super.key,
      required this.newsTitle,
      required this.imageUrl,
      required this.content});

  final String newsTitle;
  final String imageUrl;
  final String content;

  @override
  State<DetailNews> createState() => _DetailNewsState();
}

class _DetailNewsState extends State<DetailNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: safeText(text: 'News', color: Colors.white),
        backgroundColor: Color.alphaBlend(
            Colors.black.withOpacity(0.5), Colors.purple.shade700),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0.w),
          child: Column(
            children: [
              loadImages(
                imageUrl: widget.imageUrl,
                height: 300.h,
                width: MediaQuery.sizeOf(context).width,
              ),
              safeText(
                text: widget.newsTitle,
                isBold: true,
                fontSize: 25.sp,
                safeEnable: false,
              ),
              Text(widget.content),
              Text(widget.content),
              Text(widget.content),
              Text(widget.content),
              Text(widget.content),
            ],
          ),
        ),
      ),
    );
  }
}
