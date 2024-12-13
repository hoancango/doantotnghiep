import 'package:get/get.dart';
import 'package:mynewapp/api_service/footorg_api_service.dart';
import 'package:mynewapp/home/currentRounds_model.dart';
import 'package:mynewapp/home/footOrg_standings_model.dart';
import 'package:mynewapp/home/matches_model.dart';
import 'package:mynewapp/api_service/rapid_api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api_service/news_api_service.dart';
import 'news_model.dart';

class HomeController extends GetxController {
  late SharedPreferences prefs;
  final NewsApiService newsService = NewsApiService();
  final RapidFootballService rapidService = RapidFootballService();
  final FootOrgApiService fotOrgService = FootOrgApiService();
  String currentRound = '';
  RxString round = ''.obs;
  RxList<Articles> articlesList = <Articles>[].obs;
  RxList<Articles> favTeamNews = <Articles>[].obs;
  RxList<TotalFixtures> fixturesList = <TotalFixtures>[].obs;
  RxList<Table> standingsList = <Table>[].obs;
  RxList<Table> shortList = <Table>[].obs;
  RxBool isLoading = true.obs;
  RxBool isError = false.obs;
  String? favKeySearch;
  Rx<String?> favTitle = Rxn();

  @override
  Future<void> onInit() async {
    isLoading.value = true;
    prefs = await SharedPreferences.getInstance();
    favKeySearch = prefs.getString('teamNewsChoice');
    favTitle.value = prefs.getString('shortTeamNameChoice');
    await getPopularNews();
    await getFavTeamNews(keySearch: favKeySearch);
    await getCurrentRound();
    await getFixtures(round: currentRound);
    await getStandings();
    if (standingsList.length > 6) {
      shortList.addAll(standingsList.take(6));
    } else {
      shortList.addAll(standingsList);
    }
    round.value = currentRound.replaceAll(RegExp(r'[^0-9]'), '');

    isLoading.value = false;
    super.onInit();
  }
  //make loading screen

  void loadFavChoice() {
    favKeySearch = prefs.getString('favTeamNews');
  }

  Future<void> getPopularNews() async {
    isError.value = false;
    final News? response = await newsService.fetchNews(
      keySearch: 'premier league',
      // page: 1,
    );

    //keysearch AND

    if (response != null) {
      articlesList.addAll(
          response.articles?.where((article) => !article.hasNullValues()) ??
              []);
    } else {
      isError.value = true;
      Get.snackbar('Error', 'Error occur');
    }
  }

  Future<void> getFavTeamNews({String? keySearch}) async {
    isError.value = false;
    News? response;

    if (keySearch != null) {
      response = await newsService.fetchNews(
        keySearch: keySearch,
        // page: 1,
      );
    }

    //keysearch AND

    if (response != null) {
      favTeamNews.clear();
      favTeamNews.addAll(
          response.articles?.where((article) => !article.hasNullValues()) ??
              []);
    } else {
      isError.value = true;
      Get.snackbar('Error', 'Error occur');
    }
  }

  Future<void> getCurrentRound() async {
    isError.value = false;
    final PLCurrentRound? response = await rapidService.fetchCurrentRound();

    if (response != null) {
      currentRound = response.response?[0].round ?? '';
    } else {
      isError.value = true;
      Get.snackbar('Error', 'Error occur');
    }
  }

  Future<void> getFixtures({String? round}) async {
    isError.value = false;
    final PLFixtures? response =
        await rapidService.fetchFixtures(league: 39, currentRound: round);

    if (response != null) {
      fixturesList.addAll(response.fixturesList ?? []);
    } else {
      isError.value = true;
      Get.snackbar('Error', 'Error occur');
    }
  }

  Future<void> getStandings() async {
    isError.value = false;
    final FotOrgPLStandings? response = await fotOrgService.fetchStandings();

    if (response != null) {
      standingsList.addAll(response.standings?[0].table ?? []);
    } else {
      isError.value = true;
      Get.snackbar('Error', 'Error occur');
    }
  }
}
