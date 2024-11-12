import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mynewapp/common_resources.dart';

class CustomTabView extends StatefulWidget {
  const CustomTabView({
    super.key,
    required this.tabs,
    required this.tabContents,
    required this.height,
  });
  final List<String> tabs;
  final List<Widget> tabContents;
  final double height;

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final RxInt selectedTabIndex = 0.obs;

  @override
  void initState() {
    _tabController = TabController(
      length: widget.tabs.length,
      vsync: this,
    );
    _tabController.addListener((){
      selectedTabIndex.value = _tabController.index;
    });

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Column(
        children: [
          Obx(
          ()=> CustomTabBar(
              tabs: widget.tabs,
              selectedTabs: selectedTabIndex.value,
              onTabChanged: (tabIndex) {
                _tabController.animateTo(tabIndex);
              },
            ),
          ),
          SizedBox(height: 20.h,),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: widget.tabContents,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTabBar extends StatefulWidget {
  const CustomTabBar(
      {super.key,
      required this.tabs,
      required this.selectedTabs,
      required this.onTabChanged});
  final List<String> tabs;
  final int selectedTabs;
  final ValueChanged<int> onTabChanged;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(5.0.w),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: List.generate(widget.tabs.length, (index) {
          bool isSelected = (widget.selectedTabs == index);
          return Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () => widget.onTabChanged(index),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0.w),
                  color: (isSelected == true) ? Colors.lightBlue : null,
                ),
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0.h,
                  ),
                  child: safeText(
                    text: widget.tabs[index],
                    fontSize: 17.sp,
                    color: (isSelected == true) ? Colors.white : null,
                  ),
                )),
              ),
            ),
          );
        }),
      ),
    );
  }
}
