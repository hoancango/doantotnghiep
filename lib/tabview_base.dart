import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common_resources.dart';

class TabBase extends StatefulWidget {
  const TabBase({
    super.key,
    required this.tabTitleList,
    required this.tabs,
    this.tabBarColor,
    this.tabTextSize,
  });
  final List<String> tabTitleList;
  final List<Widget> tabs;
  final Color? tabBarColor;
  final double? tabTextSize;

  @override
  State<TabBase> createState() => _TabBaseState();
}

class _TabBaseState extends State<TabBase> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController =
        TabController(length: widget.tabTitleList.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: widget.tabBarColor),
            child: TabBar(
              isScrollable: true,
              controller: _tabController,
              indicatorColor: Colors.white,
              labelColor:
                  (widget.tabBarColor != Colors.white) ? Colors.white : null,
              unselectedLabelColor: Colors.grey.shade400,
              tabs: List.generate(widget.tabTitleList.length, (index) {
                return tabLabel(
                  label: widget.tabTitleList[index],
                  labelSize: widget.tabTextSize,
                );
              }),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: widget.tabs,
            ),
          ),
        ],
      ),
    );
  }

  Widget tabLabel({
    required String label,
    double? labelSize,
  }) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
      child: Center(
          child: safeText(
        text: label,
        fontSize: labelSize,
      )),
    );
  }
}
