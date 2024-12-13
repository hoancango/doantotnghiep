import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mynewapp/common_resources.dart';
import 'package:mynewapp/home/footOrg_standings_model.dart' as foot_org;

class Standings extends StatefulWidget {
  const Standings({super.key, this.standingsData,});
  final List<foot_org.Table>? standingsData;

  @override
  State<Standings> createState() => _StandingsState();
}

class _StandingsState extends State<Standings> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: safeText(text: 'Standings', color: Colors.white),
        backgroundColor: commonColor(),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 2),
                shadowContainer(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: standings(widget.standingsData ?? []),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }

  // Widget standings(List<Map<String, dynamic>> totalData) {
  //   return ListView.builder(
  //       shrinkWrap: true,
  //       physics: const NeverScrollableScrollPhysics(),
  //       itemCount: totalData.length,
  //       itemBuilder: (context, index) {
  //         int position = totalData[index]['position'];
  //         Map<String, dynamic> teamData = totalData[index]['team'];
  //         String shortName = teamData['shortName'];
  //         String crest = teamData['crest'];
  //         int playedGames = totalData[index]['playedGames'];
  //         int goalDifference = totalData[index]['goalDifference'];
  //         int points = totalData[index]['points'];
  //         int won = totalData[index]['won'];
  //         int draw = totalData[index]['draw'];
  //         int lost = totalData[index]['lost'];
  //         int goalsFor = totalData[index]['goalsFor'];
  //         int goalsAgainst = totalData[index]['goalsAgainst'];
  //
  //         return standingsRow(
  //           position: position,
  //           crest: crest,
  //           shortName: shortName,
  //           playedGames: playedGames,
  //           goalDifference: goalDifference,
  //           points: points,
  //           won: won,
  //           draw: draw,
  //           lost: lost,
  //           goalsFor: goalsFor,
  //           goalsAgainst: goalsAgainst,
  //         );
  //       });
  // }

  Widget standings(List<foot_org.Table> totalData) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: totalData.length,
        itemBuilder: (context, index) {
          final basePath = totalData[index];
          int position = basePath.position ?? 0;
          String shortName = basePath.team?.shortName ?? '';
          String crest = basePath.team?.crest ?? '';
          int playedGames = basePath.playedGames ?? 0;
          int goalDifference = basePath.goalDifference ?? 0;
          int points = basePath.points ?? 0;
          int won = basePath.won ?? 0;
          int draw = basePath.draw ?? 0;
          int lost = basePath.lost ?? 0;
          int goalsFor = basePath.goalsFor ?? 0;
          int goalsAgainst = basePath.goalsAgainst ?? 0;

          return standingsRow(
            position: position,
            crest: crest,
            shortName: shortName,
            playedGames: playedGames,
            goalDifference: goalDifference,
            points: points,
            won: won,
            draw: draw,
            lost: lost,
            goalsFor: goalsFor,
            goalsAgainst: goalsAgainst,
          );
        });
  }

// shadowContainer(
//   child: Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: globalDropDownBox(
//       initialIndex: 0,
//       dropDownData: competitions,
//       addImageData: cupsImages,
//       onValueChanged: (index){}
//     ),
//   ),
// ),

}
