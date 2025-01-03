import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynewapp/home/home_controller.dart';
import 'package:mynewapp/news/news_controller.dart';
import 'package:mynewapp/welcome/fav_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingController extends GetxController {
  late SharedPreferences prefs;
  RxString selectedLanguage = 'Tiếng Việt'.obs;
  late HomeController homeController;
  late NewsController newsController;
  FavouriteQuestController welcomeController = FavouriteQuestController();
  Rx<String?> shortNameChoice = Rxn();
  Rx<String?> crestChoice = Rxn();

  Rxn<bool> isDarkMode = Rxn<bool>();

  @override
  Future<void> onInit() async {
    if (Get.isRegistered<HomeController>()) {
      homeController = Get.find<HomeController>();
    }
    if (Get.isRegistered<NewsController>()) {
      newsController = Get.find<NewsController>();
    }
    prefs = await SharedPreferences.getInstance();
    loadSelectedLanguage();
    loadSelectedTheme();
    loadFavouriteUserChoice();
    super.onInit();
  }

  void changeThemeToSystem() {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    if (brightness == Brightness.dark) {
      Get.changeTheme(ThemeData.dark());
    } else {
      Get.changeTheme(ThemeData.light());
    }
  }

  void loadFavouriteUserChoice() {
    crestChoice.value = prefs.getString('teamCrestChoice');
    shortNameChoice.value = prefs.getString('shortTeamNameChoice');
  }

  Future<void> saveFavouriteUserChoice(
      int selectedIndex, String selectedOrgName) async {
    welcomeController.selectedIndex.value = selectedIndex;
    welcomeController.selectedOrgShortName = selectedOrgName;
    final rapidFavTeam = welcomeController
        .commonRapidPLTeams.plTeams?[welcomeController.selectedIndex.value];
    final teamName = rapidFavTeam?.team?.name;
    final teamCode = rapidFavTeam?.team?.code;
    final crest = rapidFavTeam?.team?.logo;
    if (teamName != null) {
      await prefs.setString('teamNewsChoice', teamName);
    }
    if (teamCode != null) {
      await prefs.setString('teamCodeChoice', teamCode);
    }
    if (crest != null) {
      await prefs.setString('teamCrestChoice', crest);
    }
    // save link icon
    if (welcomeController.selectedOrgShortName.isNotEmpty) {
      await prefs.setString(
        'shortTeamNameChoice',
        welcomeController.selectedOrgShortName,
      );
    }
  }

  Future<void> saveSelectedLanguage(String userChoice) async {
    selectedLanguage.value = userChoice;
    await prefs.setString('selectedLanguage', selectedLanguage.value);
  }

  Future<void> loadSelectedLanguage() async {
    final data = prefs.getString('selectedLanguage');
    if (data != null) {
      selectedLanguage.value = data;
    }
  }

  Future<void> saveSelectedTheme({bool? isDarkTheme}) async {
    if (isDarkTheme != null) {
      await prefs.setBool('isDarkMode', isDarkTheme);
    } else {
      await prefs.remove('isDarkMode');
    }
  }

  Future<void> loadSelectedTheme() async {
    isDarkMode.value = prefs.getBool('isDarkMode');
  }
}
