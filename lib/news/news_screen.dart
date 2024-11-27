import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mynewapp/base_screen.dart';
import 'package:mynewapp/common_resources.dart';
import 'package:mynewapp/home/news_model.dart';
import 'package:mynewapp/news/news_controller.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: BaseScreen(
        label: 'Tin tức',
        appBar: AppBar(
          title: const Text(
            'Tin tức',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: commonColor(),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.h),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0)),
                child: TabBar(
                  labelColor: Colors.lightBlue,
                  indicatorColor: Colors.lightBlue,
                  tabs: [
                    tabLabel('PL'),
                    tabLabel('MUN'),
                    tabLabel('TTCN'),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            NewsContentTab(category: 'PL'),
            NewsContentTab(category: 'MUN'),
            NewsContentTab(category: 'TTCN'),
          ],
        ),
      ),
    );
  }

  Widget newsWidget(
    String imageUrl,
    String title,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: loadImages(
              imageUrl: imageUrl,
              height: 80.h,
              width: 80.h,
              circularRadius: 10,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          // Text(
          //   type,
          //   style: TextStyle(
          //     color: Colors.grey.shade400,
          //     fontWeight: FontWeight.bold,
          //     fontSize: 10,
          //   ),
          // ),
          Expanded(
            flex: 3,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget labelWidget(String imageUrl, String label) {
    return Row(
      children: [
        Common.loadImages(imageUrl: imageUrl, height: 30.h, width: 30.w),
        SizedBox(
          width: 5,
        ),
        safeText(
          text: label,
          fontSize: 18.sp,
          isBold: true,
        )
      ],
    );
  }

  Widget tabLabel(
    String label,
  ) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
      child: Center(child: safeText(text: label)),
    );
  }
}

class NewsContentTab extends StatefulWidget {
  const NewsContentTab({
    super.key,
    required this.category,
  });
  final String category;

  @override
  State<NewsContentTab> createState() => _NewsContentTabState();
}

class _NewsContentTabState extends State<NewsContentTab>
    with AutomaticKeepAliveClientMixin {
  late NewsController _controller;
  late RxList<Articles> dataSource;

  @override
  void initState() {
    _controller = Get.put(NewsController(), permanent: true,);
    manageDataSource();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Obx(() {
        (_controller.isLoading.value)
            ? context.loaderOverlay.show()
            : context.loaderOverlay.hide();
        return (_controller.isLoading.value)
            ? Container()
            : SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: dataSource.toList().length,
                      itemBuilder: (context, index) {
                        return newsWidget(
                          dataSource[index].urlToImage ??
                              "https://i2-prod.manchestereveningnews.co.uk/incoming/article30217682.ece/ALTERNATES/s1200/0_JS346592155.jpg",
                          dataSource[index].title ??
                              "How to watch Fenerbahce vs Manchester United",
                        );
                      },
                    ),
                    SizedBox(
                      height: 100.h,
                    )
                  ],
                ),
              );
      }),
    );
  }

  Widget newsWidget(
    String imageUrl,
    String title,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: loadImages(
              imageUrl: imageUrl,
              height: 80.h,
              width: 80.h,
              circularRadius: 10,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          // Text(
          //   type,
          //   style: TextStyle(
          //     color: Colors.grey.shade400,
          //     fontWeight: FontWeight.bold,
          //     fontSize: 10,
          //   ),
          // ),
          Expanded(
            flex: 3,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget labelWidget(String imageUrl, String label) {
    return Row(
      children: [
        Common.loadImages(imageUrl: imageUrl, height: 30.h, width: 30.w),
        SizedBox(
          width: 5,
        ),
        safeText(
          text: label,
          fontSize: 18.sp,
          isBold: true,
        )
      ],
    );
  }

  manageDataSource() {
    (widget.category == 'PL')
        ? dataSource = _controller.shortPlNews
        : (widget.category == 'MUN')
            ? dataSource = _controller.shortFavNews
            : dataSource = _controller.shortTransferNews;
  }
}
