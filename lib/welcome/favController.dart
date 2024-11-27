import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteController extends GetxController {
  late SharedPreferences prefs;
  List<Map<String, dynamic>> chosenTeams = [];

  @override
  Future<void> onInit() async {
    prefs = await SharedPreferences.getInstance();
    List<String>? userChosenTeams = prefs.getStringList('FavouriteTeamsList');
    if(userChosenTeams != null){
      chosenTeams = convertToMapList(userChosenTeams);
    }
    super.onInit();
  }

  Future<void> saveFavTeams(List<Map<String, dynamic>> inputList) async {
    List<String> stringList = inputList.map((e) => jsonEncode(e)).toList();
    prefs.setStringList('FavouriteTeamsList', stringList);
  }

  List<Map<String, dynamic>> convertToMapList(List<String> input) {
    List<Map<String, dynamic>> mapList =
        input.map((e) => Map<String, dynamic>.from(jsonDecode(e))).toList();
    return mapList;
  }


}
