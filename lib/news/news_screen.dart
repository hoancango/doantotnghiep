import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynewapp/base_screen.dart';
import 'package:mynewapp/common_resources.dart';

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
  const NewsContentTab({super.key, required this.category});
  final String category;

  @override
  State<NewsContentTab> createState() => _NewsContentTabState();
}

class _NewsContentTabState extends State<NewsContentTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50.h,
              child: Row(
                children: [
                  Common.loadImages(
                      imageUrl: "https://crests.football-data.org/66.png",
                      height: 30.h,
                      width: 30.w),
                  SizedBox(
                    width: 5,
                  ),
                  safeText(
                    text: 'Manchester United',
                    fontSize: 18.sp,
                    isBold: true,
                  )
                ],
              ),
            ),
            newsWidget(
              "https://i2-prod.manchestereveningnews.co.uk/incoming/article30217682.ece/ALTERNATES/s1200/0_JS346592155.jpg",
              "How to watch Fenerbahce vs Manchester United",
            ),
            newsWidget(
              "https://talksport.com/wp-content/uploads/sites/5/2024/10/fenerbahce-vs-man-utd-betting-predictions-op.jpg?strip=all&quality=100&w=1920&h=1080&crop=1",
              "Fenerbahce vs Manchester United predictions, odds and betting tips",
            ),
            newsWidget(
              "https://i2-prod.birminghammail.co.uk/incoming/article30216206.ece/ALTERNATES/s1200/0_Manchester-United-Training-Session-And-Press-Conference-UEFA-Europa-League-202425-League-Phase-MD.jpg",
              "Former Arsenal star slams 'disgusting' Man United decision as Erik ten Hag problem exposed",
            ),
            SizedBox(
              height: 10.h,
            ),
            labelWidget("https://crests.football-data.org/65.png",
                "Manchester City FC"),
            newsWidget(
              "https://i2-prod.manchestereveningnews.co.uk/incoming/article29927756.ece/ALTERNATES/s1200/1_GettyImages-2156948374.jpg",
              "87, 27 and 1.4 - the three numbers that make Man City win the league every year",
            ),
            newsWidget(
              "https://i2-prod.manchestereveningnews.co.uk/incoming/article30216886.ece/ALTERNATES/s1200/0_GettyImages-2179679060.jpg",
              "I saw Man City man show hidden leadership quality and prove Pep Guardiola's point in ten minutes",
            ),
            newsWidget(
              "https://i2-prod.manchestereveningnews.co.uk/incoming/article30216562.ece/ALTERNATES/s1200/0_GettyImages-2179677025.jpg",
              "Man City next six fixtures compared to Liverpool, Arsenal and rivals as title race reality emerges",
            ),
            SizedBox(
              height: 100.h,
            )
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
}
