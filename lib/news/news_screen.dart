import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mynewapp/base_screen.dart';
import 'package:mynewapp/common_resources.dart';
import 'package:mynewapp/home/home_controller.dart';
import 'package:mynewapp/home/news_model.dart';
import 'package:mynewapp/news/news_controller.dart';
import 'package:mynewapp/news_detail/detailNews.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewsScreen> {
  late NewsController _controller;

  @override
  void initState() {
    _controller = Get.put(
      NewsController(),
      permanent: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: BaseScreen(
        label: 'News'.tr,
        appBar: AppBar(
          title: Text(
            'News'.tr,
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
                    Obx(() => tabLabel(_controller.teamCodeChoice.value)),
                    tabLabel('Transfer'.tr),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            NewsContentTab(
              category: 'PL',
              controller: _controller,
            ),
            NewsContentTab(
              category: 'MUN',
              controller: _controller,
            ),
            NewsContentTab(
              category: 'TTCN',
              controller: _controller,
            ),
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
    String? label,
  ) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
      child: (label != null)
          ? Center(child: safeText(text: label))
          : const Icon(
              Icons.star,
              color: Colors.yellow,
            ),
    );
  }
}

class NewsContentTab extends StatefulWidget {
  const NewsContentTab({
    super.key,
    required this.category,
    required this.controller,
  });
  final String category;
  final NewsController controller;

  @override
  State<NewsContentTab> createState() => _NewsContentTabState();
}

class _NewsContentTabState extends State<NewsContentTab>
    with AutomaticKeepAliveClientMixin {
  late NewsController _controller;
  late List<Articles> firstStorage;
  late RxList<Articles> shortData;
  late ScrollController _scrollController;

  @override
  void initState() {
    _controller = widget.controller;
    manageDataSource();
    _scrollController = ScrollController();
    _scrollController.addListener(manageNumbersOfNews);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
                controller: _scrollController,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: shortData.toList().length,
                      itemBuilder: (context, index) {
                        final basePath = shortData[index];
                        return InkWell(
                          onTap: () {
                            Get.to(DetailNews(
                              newsTitle: basePath.title ?? '',
                              imageUrl: basePath.urlToImage ?? '',
                              content: basePath.content ?? '',
                              otherInfo: 'Newest'.tr,
                              description: basePath.description ?? '',
                            ));
                          },
                          child: newsWidget(
                            shortData[index].urlToImage ??
                                "https://i2-prod.manchestereveningnews.co.uk/incoming/article30217682.ece/ALTERNATES/s1200/0_JS346592155.jpg",
                            shortData[index].title ??
                                "How to watch Fenerbahce vs Manchester United",
                          ),
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

  void manageDataSource() {
    if (widget.category == 'PL') {
      firstStorage = _controller.plNews;
      shortData = _controller.shortPlNews;
    } else if (widget.category == 'MUN') {
      firstStorage = _controller.favTeamNews;
      shortData = _controller.shortFavNews;
    } else {
      firstStorage = _controller.transferNews;
      shortData = _controller.shortTransferNews;
    }
  }

  void manageNumbersOfNews() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _controller.loadMore(firstStorage, shortData);
      }
    }
  }
}
