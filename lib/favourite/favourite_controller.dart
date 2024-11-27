import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynewapp/common_data/common_data_org_teams.dart';
import 'package:mynewapp/common_data/common_data_plTeams_model.dart';
import 'package:mynewapp/common_data/common_player_data.dart';
import 'package:mynewapp/common_data/common_player_rapid_model.dart'
    as rapid_players;
import 'package:mynewapp/common_data/teams_pl_rapid_model.dart';
import 'package:mynewapp/common_resources.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common_data/teams_pl_rapid_model.dart' as rapid_teams;
import '../common_data/teams_rapid.dart';

class FavouriteController extends GetxController {
  // final _storage = FirebaseFirestore.instance;
  late SharedPreferences prefs;

  rapid_teams.RapidPLTeams commonRapidPLTeams =
      rapid_teams.RapidPLTeams.fromJson(rapidPLTeams);
  OrgPLTeams commonOrgPLTeams = OrgPLTeams.fromJson(orgPlTeams);
  rapid_players.TotalPlPlayers commonPlPlayers =
      rapid_players.TotalPlPlayers.fromJson(plPlayers);

  RxSet<rapid_teams.PlTeams> favTeams = <rapid_teams.PlTeams>{}.obs;
  List<Color> colorByTeams = <Color>[];
  List<rapid_players.Team> teamsOfFavPlayers = <rapid_players.Team>[];
  RxSet<rapid_players.Players> favPlayers = <rapid_players.Players>{}.obs;
  List<Color> colorByPlayers = <Color>[];
  Set<int> orgIds= {};

  // @override
  // Future<void> onInit() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   loadFavTeamsData();
  //   loadFavPlayersData();
  //
  //   super.onInit();
  // }
  Color getColorPLDataById({
    int? teamRapidId,
  }) {
    late PlTeams? rapidCheckBase;

    try {
      rapidCheckBase = commonRapidPLTeams.plTeams?.firstWhere(
        (e) => e.team?.id == teamRapidId,
      );
    } catch (e) {
      return Colors.grey;
    }

    String teamCode = '';
    String teamName = '';

    teamCode = rapidCheckBase?.team?.code ?? '';
    teamName = rapidCheckBase?.team?.name ?? '';

    getColorPLDataByName(teamCode: teamCode, teamName: teamName);

    return getColorPLDataByName(teamCode: teamCode, teamName: teamName);
  }

  Color getColorPLDataByName({
    required String teamCode,
    required String teamName,
  }) {
    Color result = Colors.grey;
    String? orgColor;

    try {
      orgColor = commonOrgPLTeams.teams
          ?.firstWhere((team) => team.tla == teamCode)
          .clubColors;
    } catch (e) {
      orgColor = null;
    }

    (orgColor != null)
        ? result = convertColor(orgColor)
        : orgColor = commonOrgPLTeams.teams
            ?.firstWhere((team) => team.name?.contains(teamName) ?? false)
            .clubColors;

    (orgColor != null) ? result = convertColor(orgColor) : null;

    return result;
  }

  int getOrgIdByRapidId({
    int? teamRapidId,
  }) {
    String teamCode = '';
    String teamName = '';
    late PlTeams? rapidCheckBase;

    try {
      rapidCheckBase = commonRapidPLTeams.plTeams?.firstWhere(
        (e) => e.team?.id == teamRapidId,
      );
    } catch (e) {
      return 66;
    }

    teamCode = rapidCheckBase?.team?.code ?? '';
    teamName = rapidCheckBase?.team?.name ?? '';

    return getOrgClubIDByName(teamCode: teamCode, teamName: teamName);
  }

  int getOrgClubIDByName({
    required String teamCode,
    required String teamName,
  }) {
    int result = 66;
    int? orgId;

    try {
      orgId =
          commonOrgPLTeams.teams?.firstWhere((team) => team.tla == teamCode).id;
    } catch (e) {
      orgId = null;
    }
    (orgId == null)
        ? orgId = commonOrgPLTeams.teams
            ?.firstWhere((team) => team.name?.contains(teamName) ?? false)
            .id
        : null;

    (orgId != null) ? result = orgId : null;

    return result;
  }

  Future<void> saveFavTeamsData() async {
    List<String> jsonList = favTeams.map((team) => jsonEncode(team.toJson())).toList();
    await prefs.setStringList('favTeams', jsonList);
  }

  Future<void> saveFavPlayersData() async {
    List<String> jsonList = favPlayers.map((player) => jsonEncode(player.toJson())).toList();
    await prefs.setStringList('favPlayers', jsonList);
  }

  void loadFavTeamsData() {
    List<String>? jsonList = prefs.getStringList('favTeams');
    if(jsonList != null){
    favTeams.addAll(jsonList.map((json) => rapid_teams.PlTeams.fromJson(jsonDecode(json))));
    }
  }

  void loadFavPlayersData() {
    List<String>? jsonList = prefs.getStringList('favPlayers');
    if(jsonList != null){
      favPlayers.addAll(jsonList.map((json) => rapid_players.Players.fromJson(jsonDecode(json))));
    }
  }


}
