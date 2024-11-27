import 'package:get/get.dart';
import 'package:mynewapp/api_service/footorg_api_service.dart';
import 'package:mynewapp/home/currentRounds_model.dart';
import 'package:mynewapp/home/footOrg_standings_model.dart';
import 'package:mynewapp/home/matches_model.dart';
import 'package:mynewapp/api_service/rapid_api_service.dart';
import '../api_service/news_api_service.dart';
import 'news_model.dart';

class HomeController extends GetxController {
  final NewsApiService newsService = NewsApiService();
  final RapidFootballService rapidService = RapidFootballService();
  final FootOrgApiService fotOrgService = FootOrgApiService();
  String currentRound = '';
  RxString onlyRoundNumber = ''.obs;
  RxList<Articles> articlesList = <Articles>[].obs;
  RxList<Articles> favTeamNews = <Articles>[].obs;
  RxList<TotalFixtures> fixturesList = <TotalFixtures>[].obs;
  RxList<Table> standingsList = <Table>[].obs;
  RxList<Table> shortList = <Table>[].obs;

  @override
  Future<void> onInit() async {
    await getPopularNews();
    await getFavTeamNews();
    await getCurrentRound();
    await getFixtures(round: currentRound);
    await getStandings();
    if (standingsList.length > 6) {
      shortList.addAll(standingsList.take(6));
    }else{
      shortList.addAll(standingsList);
    }
    onlyRoundNumber.value = currentRound.replaceAll(RegExp(r'[^0-9]'), '');
    super.onInit();
  }
  //make loading screen

  Future<void> getPopularNews() async {
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
      Get.snackbar('Error', 'Error occur');
    }
  }

  Future<void> getFavTeamNews() async {
    final News? response = await newsService.fetchNews(
      keySearch: 'manchester united',
      // page: 1,
    );

    //keysearch AND

    if (response != null) {
      favTeamNews.addAll(
          response.articles?.where((article) => !article.hasNullValues()) ??
              []);
    } else {
      Get.snackbar('Error', 'Error occur');
    }
  }

  Future<void> getCurrentRound() async {
    final PLCurrentRound? response = await rapidService.fetchCurrentRound();

    if (response != null) {
      currentRound = response.response?[0].round ?? '';
    } else {
      Get.snackbar('Error', 'Error occur');
    }
  }

  Future<void> getFixtures({String? round}) async {
    final PLFixtures? response =
        await rapidService.fetchFixtures(league: 39,currentRound: round);

    if (response != null) {
      fixturesList.addAll(response.fixturesList ?? []);
    } else {
      Get.snackbar('Error', 'Error occur');
    }
  }

  Future<void> getStandings() async {
    final FotOrgPLStandings? response = await fotOrgService.fetchStandings();

    if (response != null) {
      standingsList.addAll(response.standings?[0].table ?? []);
    } else {
      Get.snackbar('Error', 'Error occur');
    }
  }
}
