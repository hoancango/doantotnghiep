import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynewapp/common_data/common_data_plTeams_model.dart';
import 'package:mynewapp/favourite/favourite_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteQuestController extends FavouriteController {
  RxInt selectedIndex = (-1).obs;
  int selectedOrgId = -1;
  String selectedOrgShortName = '';
  Color selectedColor = Colors.grey;





  Teams? findOrgTeamsFromRapid({
    required String teamCode,
    required String teamName,
  }) {
    final team = commonOrgPLTeams.teams
        ?.where((team) =>
            team.tla == teamCode || (team.name?.contains(teamName) ?? false))
        .toList();

    return team?.first;
  }

  Future<void> saveUserFavChoice() async {
    prefs = await SharedPreferences.getInstance();
    final rapidFavTeam = commonRapidPLTeams.plTeams?[selectedIndex.value];
    final teamName = rapidFavTeam?.team?.name;
    final teamCode = rapidFavTeam?.team?.code;
    final crest = rapidFavTeam?.team?.logo;
    if (teamName != null) {
      await prefs.setString('teamNewsChoice', teamName);
    }
    if(teamCode != null){
      await prefs.setString('teamCodeChoice', teamCode);
    }
    if(selectedOrgShortName.isNotEmpty){
      await prefs.setString('shortTeamNameChoice', selectedOrgShortName);
    }
    if(crest != null){
      await prefs.setString('teamCrestChoice', crest);
    }
    if(rapidFavTeam != null){
      favTeams.add(rapidFavTeam);
    }
    orgIds.add(selectedOrgId);
    colorByTeams.add(selectedColor);
    await saveFavTeamsData();

  }

}
