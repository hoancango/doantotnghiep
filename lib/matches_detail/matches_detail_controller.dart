import 'package:get/get.dart';
import 'package:mynewapp/api_service/rapid_api_service.dart';
import 'package:mynewapp/matches_detail/head_to_head_model.dart';
import 'package:mynewapp/matches_detail/match_statistics_model.dart';

class MatchesDetailController extends GetxController {
  final RapidFootballService _service = RapidFootballService();
  List<BothTeams> totalTeamsStats = <BothTeams>[].obs;
  RxList<Statistics> teamAStats = <Statistics>[].obs;
  RxList<Statistics> teamBStats = <Statistics>[].obs;
  List<Matches> headToHead = [];
  RxList<Matches> shortHeadToHead = <Matches>[].obs;
  int? idTeamA = 0;
  int? idTeamB = 0;
  int teamAWinNumbers = 0;
  int homeWinsA = 0;
  int homeWinsB = 0;
  int awayWinsA = 0;
  int awayWinsB = 0;
  int teamBWinNumbers = 0;
  int drawNumbers = 0;
  int totalMatches = 0;
  RxBool isLoading = false.obs;
  int? matchId;

  @override
  Future<void> onInit() async {
    isLoading.value = true;
    matchId = Get.arguments['matchId'] ?? 1208111;
    idTeamA = Get.arguments['homeTeamId'] ?? 50;
    idTeamB = Get.arguments['awayTeamId'] ?? 41;
    if (matchId != null) {
      await fetchMatchDetail(matchId ?? 0);
    }
    if (idTeamA != null && idTeamB != null) {
      await fetchHeadToHead(idTeamA ?? 0, idTeamB ?? 0);
    }
    countWinMatches();
    isLoading.value = false;
    super.onInit();
  }

  void countWinMatches() {
    if (headToHead.isNotEmpty) {
      for (Matches match in headToHead) {
        final homePath = match.teams?.home;
        final awayPath = match.teams?.away;
        final homeGoals = match.goals?.home;
        final awayGoals = match.goals?.away;
        if (homeGoals != null && awayGoals != null) {
          if (homeGoals == awayGoals) {
            drawNumbers = drawNumbers + 1;
          }

          if (homeGoals > awayGoals) {
            if (homePath?.id == idTeamA) {
              teamAWinNumbers = teamAWinNumbers + 1;
              homeWinsA = homeWinsA + 1;
            } else {
              teamBWinNumbers = teamBWinNumbers + 1;
              homeWinsB = homeWinsB + 1;
            }
          }

          if (homeGoals < awayGoals) {
            if (awayPath?.id == idTeamA) {
              teamAWinNumbers = teamAWinNumbers + 1;
              awayWinsA = awayWinsA + 1;
            } else {
              teamBWinNumbers = teamBWinNumbers + 1;
              awayWinsB = awayWinsB + 1;
            }
          }
        }
      }
      totalMatches = teamAWinNumbers + teamBWinNumbers + drawNumbers;
    }
  }

  Future<void> fetchMatchDetail(int id) async {
    final response = await _service.fetchMatchesDetail(id: id);

    if (response != null) {
      totalTeamsStats.addAll(response.bothTeams ?? []);
      if (totalTeamsStats.isNotEmpty) {
        teamAStats.addAll(totalTeamsStats[0].statistics ?? []);
        teamBStats.addAll(totalTeamsStats[1].statistics ?? []);
      }
      print('KET QUA fetchMatchDetail LA ${totalTeamsStats.length}');
    }
  }

  Future<void> fetchHeadToHead(int homeId, int awayId) async {
    final response =
        await _service.fetchHeadToHead(homeTeamId: homeId, awayTeamId: awayId);

    if (response != null) {
      headToHead.addAll(response.matches ?? []);
      shortHeadToHead.addAll(headToHead.take(5));
      print('KET QUA fetchHeadToHead LA ${headToHead.length}');
    }
  }
}
