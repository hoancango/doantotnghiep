import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynewapp/common_resources.dart';

class Standings extends StatefulWidget {
  const Standings({super.key});

  @override
  State<Standings> createState() => _StandingsState();
}

class _StandingsState extends State<Standings> {
  List<String> competitions = [];
  List<String> cupsImages = [];
  List<Map<String, dynamic>> totalData = [];

  @override
  void initState() {
    competitions = [
      "Premier League 2024",
      "League Cup 2024",
      "UEFA Champions League 2024",
    ];
    cupsImages = [
      "https://media.api-sports.io/football/leagues/39.png",
      "https://media.api-sports.io/football/leagues/48.png",
      "https://media.api-sports.io/football/leagues/2.png",
    ];
    totalData = [
      {
        "position": 1,
        "team": {
          "id": 64,
          "name": "Liverpool FC",
          "shortName": "Liverpool",
          "tla": "LIV",
          "crest": "https://crests.football-data.org/64.png"
        },
        "playedGames": 10,
        "form": null,
        "won": 8,
        "draw": 1,
        "lost": 1,
        "points": 25,
        "goalsFor": 19,
        "goalsAgainst": 6,
        "goalDifference": 13
      },
      {
        "position": 2,
        "team": {
          "id": 65,
          "name": "Manchester City FC",
          "shortName": "Man City",
          "tla": "MCI",
          "crest": "https://crests.football-data.org/65.png"
        },
        "playedGames": 10,
        "form": null,
        "won": 7,
        "draw": 2,
        "lost": 1,
        "points": 23,
        "goalsFor": 21,
        "goalsAgainst": 11,
        "goalDifference": 10
      },
      {
        "position": 3,
        "team": {
          "id": 351,
          "name": "Nottingham Forest FC",
          "shortName": "Nottingham",
          "tla": "NOT",
          "crest": "https://crests.football-data.org/351.png"
        },
        "playedGames": 10,
        "form": null,
        "won": 5,
        "draw": 4,
        "lost": 1,
        "points": 19,
        "goalsFor": 14,
        "goalsAgainst": 7,
        "goalDifference": 7
      },
      {
        "position": 4,
        "team": {
          "id": 61,
          "name": "Chelsea FC",
          "shortName": "Chelsea",
          "tla": "CHE",
          "crest": "https://crests.football-data.org/61.png"
        },
        "playedGames": 10,
        "form": null,
        "won": 5,
        "draw": 3,
        "lost": 2,
        "points": 18,
        "goalsFor": 20,
        "goalsAgainst": 12,
        "goalDifference": 8
      },
      {
        "position": 5,
        "team": {
          "id": 57,
          "name": "Arsenal FC",
          "shortName": "Arsenal",
          "tla": "ARS",
          "crest": "https://crests.football-data.org/57.png"
        },
        "playedGames": 10,
        "form": null,
        "won": 5,
        "draw": 3,
        "lost": 2,
        "points": 18,
        "goalsFor": 17,
        "goalsAgainst": 11,
        "goalDifference": 6
      },
      {
        "position": 6,
        "team": {
          "id": 58,
          "name": "Aston Villa FC",
          "shortName": "Aston Villa",
          "tla": "AVL",
          "crest": "https://crests.football-data.org/58.png"
        },
        "playedGames": 10,
        "form": null,
        "won": 5,
        "draw": 3,
        "lost": 2,
        "points": 18,
        "goalsFor": 17,
        "goalsAgainst": 15,
        "goalDifference": 2
      },
      {
        "position": 7,
        "team": {
          "id": 73,
          "name": "Tottenham Hotspur FC",
          "shortName": "Tottenham",
          "tla": "TOT",
          "crest": "https://crests.football-data.org/73.png"
        },
        "playedGames": 10,
        "form": null,
        "won": 5,
        "draw": 1,
        "lost": 4,
        "points": 16,
        "goalsFor": 22,
        "goalsAgainst": 11,
        "goalDifference": 11
      },
      {
        "position": 8,
        "team": {
          "id": 397,
          "name": "Brighton & Hove Albion FC",
          "shortName": "Brighton Hove",
          "tla": "BHA",
          "crest": "https://crests.football-data.org/397.png"
        },
        "playedGames": 10,
        "form": null,
        "won": 4,
        "draw": 4,
        "lost": 2,
        "points": 16,
        "goalsFor": 17,
        "goalsAgainst": 14,
        "goalDifference": 3
      },
      {
        "position": 9,
        "team": {
          "id": 63,
          "name": "Fulham FC",
          "shortName": "Fulham",
          "tla": "FUL",
          "crest": "https://crests.football-data.org/63.png"
        },
        "playedGames": 10,
        "form": null,
        "won": 4,
        "draw": 3,
        "lost": 3,
        "points": 15,
        "goalsFor": 14,
        "goalsAgainst": 13,
        "goalDifference": 1
      },
      {
        "position": 10,
        "team": {
          "id": 1044,
          "name": "AFC Bournemouth",
          "shortName": "Bournemouth",
          "tla": "BOU",
          "crest": "https://crests.football-data.org/bournemouth.png"
        },
        "playedGames": 10,
        "form": null,
        "won": 4,
        "draw": 3,
        "lost": 3,
        "points": 15,
        "goalsFor": 13,
        "goalsAgainst": 12,
        "goalDifference": 1
      },
      {
        "position": 11,
        "team": {
          "id": 67,
          "name": "Newcastle United FC",
          "shortName": "Newcastle",
          "tla": "NEW",
          "crest": "https://crests.football-data.org/67.png"
        },
        "playedGames": 10,
        "form": null,
        "won": 4,
        "draw": 3,
        "lost": 3,
        "points": 15,
        "goalsFor": 10,
        "goalsAgainst": 10,
        "goalDifference": 0
      },
      {
        "position": 12,
        "team": {
          "id": 402,
          "name": "Brentford FC",
          "shortName": "Brentford",
          "tla": "BRE",
          "crest": "https://crests.football-data.org/402.png"
        },
        "playedGames": 10,
        "form": null,
        "won": 4,
        "draw": 1,
        "lost": 5,
        "points": 13,
        "goalsFor": 19,
        "goalsAgainst": 20,
        "goalDifference": -1
      },
      {
        "position": 13,
        "team": {
          "id": 66,
          "name": "Manchester United FC",
          "shortName": "Man United",
          "tla": "MUN",
          "crest": "https://crests.football-data.org/66.png"
        },
        "playedGames": 10,
        "form": null,
        "won": 3,
        "draw": 3,
        "lost": 4,
        "points": 12,
        "goalsFor": 9,
        "goalsAgainst": 12,
        "goalDifference": -3
      },
      {
        "position": 14,
        "team": {
          "id": 563,
          "name": "West Ham United FC",
          "shortName": "West Ham",
          "tla": "WHU",
          "crest": "https://crests.football-data.org/563.png"
        },
        "playedGames": 10,
        "form": null,
        "won": 3,
        "draw": 2,
        "lost": 5,
        "points": 11,
        "goalsFor": 13,
        "goalsAgainst": 19,
        "goalDifference": -6
      },
      {
        "position": 15,
        "team": {
          "id": 338,
          "name": "Leicester City FC",
          "shortName": "Leicester City",
          "tla": "LEI",
          "crest": "https://crests.football-data.org/338.png"
        },
        "playedGames": 10,
        "form": null,
        "won": 2,
        "draw": 4,
        "lost": 4,
        "points": 10,
        "goalsFor": 14,
        "goalsAgainst": 18,
        "goalDifference": -4
      },
      {
        "position": 16,
        "team": {
          "id": 62,
          "name": "Everton FC",
          "shortName": "Everton",
          "tla": "EVE",
          "crest": "https://crests.football-data.org/62.png"
        },
        "playedGames": 10,
        "form": null,
        "won": 2,
        "draw": 3,
        "lost": 5,
        "points": 9,
        "goalsFor": 10,
        "goalsAgainst": 17,
        "goalDifference": -7
      },
      {
        "position": 17,
        "team": {
          "id": 354,
          "name": "Crystal Palace FC",
          "shortName": "Crystal Palace",
          "tla": "CRY",
          "crest": "https://crests.football-data.org/354.png"
        },
        "playedGames": 10,
        "form": null,
        "won": 1,
        "draw": 4,
        "lost": 5,
        "points": 7,
        "goalsFor": 8,
        "goalsAgainst": 13,
        "goalDifference": -5
      },
      {
        "position": 18,
        "team": {
          "id": 349,
          "name": "Ipswich Town FC",
          "shortName": "Ipswich Town",
          "tla": "IPS",
          "crest": "https://crests.football-data.org/349.png"
        },
        "playedGames": 10,
        "form": null,
        "won": 0,
        "draw": 5,
        "lost": 5,
        "points": 5,
        "goalsFor": 10,
        "goalsAgainst": 21,
        "goalDifference": -11
      },
      {
        "position": 19,
        "team": {
          "id": 340,
          "name": "Southampton FC",
          "shortName": "Southampton",
          "tla": "SOU",
          "crest": "https://crests.football-data.org/340.png"
        },
        "playedGames": 10,
        "form": null,
        "won": 1,
        "draw": 1,
        "lost": 8,
        "points": 4,
        "goalsFor": 7,
        "goalsAgainst": 19,
        "goalDifference": -12
      },
      {
        "position": 20,
        "team": {
          "id": 76,
          "name": "Wolverhampton Wanderers FC",
          "shortName": "Wolverhampton",
          "tla": "WOL",
          "crest": "https://crests.football-data.org/76.png"
        },
        "playedGames": 10,
        "form": null,
        "won": 0,
        "draw": 3,
        "lost": 7,
        "points": 3,
        "goalsFor": 14,
        "goalsAgainst": 27,
        "goalDifference": -13
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: safeText(text: 'Standings', color: Colors.white),
        backgroundColor: commonColor(),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 85.h),
                shadowContainer(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: standings(totalData),
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
              ],
            ),
          ),
      
          shadowContainer(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: globalDropDownBox(
                initialValue: competitions[0],
                dropDownData: competitions,
                addImageData: cupsImages,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget standings(List<Map<String, dynamic>> totalData) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: totalData.length,
        itemBuilder: (context, index) {
          int position = totalData[index]['position'];
          Map<String, dynamic> teamData = totalData[index]['team'];
          String shortName = teamData['shortName'];
          String crest = teamData['crest'];
          int playedGames = totalData[index]['playedGames'];
          int goalDifference = totalData[index]['goalDifference'];
          int points = totalData[index]['points'];
          int won = totalData[index]['won'];
          int draw = totalData[index]['draw'];
          int lost = totalData[index]['lost'];
          int goalsFor = totalData[index]['goalsFor'];
          int goalsAgainst = totalData[index]['goalsAgainst'];

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
}
