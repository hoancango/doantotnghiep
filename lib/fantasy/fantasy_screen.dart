import 'package:flutter/material.dart';
import 'package:mynewapp/base_screen.dart';

class FantasyScreen extends StatefulWidget {
  const FantasyScreen({super.key});

  @override
  State<FantasyScreen> createState() => _FantasyScreenState();
}

class _FantasyScreenState extends State<FantasyScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      label: 'Fantasy',
      appBar: AppBar(title: const Text('Fantasy'),),
      body: Column(
        children: [
          //Football Field
          Icon(Icons.rectangle),
          playerInfoWidget(),
        ],
      ),
    );
  }

  Widget playerInfoWidget() {
    return Container(
      height: 200,
      width: 100,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
      ),
      child: Column(
        children: [
          Icon(Icons.person),
          Text('Player Name'),
          Text('Current Team'),
        ],
      ),
    );
  }
}
