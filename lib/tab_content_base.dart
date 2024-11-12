import 'package:flutter/material.dart';

class TabContentBase extends StatefulWidget {
  const TabContentBase({super.key, required this.body});
  final Widget body;

  @override
  State<TabContentBase> createState() => _TabContentBaseState();
}

class _TabContentBaseState extends State<TabContentBase> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: widget.body,
    );
  }


}
