import 'package:get/get.dart';
import 'package:mynewapp/api_service/rapid_api_service.dart';
import 'package:mynewapp/home/matches_model.dart';

class MatchesController extends GetxController {
  final RapidFootballService service = RapidFootballService();

  List<TotalFixtures> plMatches = [];
  List<TotalFixtures> uclMatches = [];
  List<TotalFixtures> sortPl = [];
  List<TotalFixtures> sortUcl = [];
  List<TotalFixtures> shortPlMatches = <TotalFixtures>[];
  List<TotalFixtures> shortUclMatches = <TotalFixtures>[];
  RxSet<String> plTeams = <String>{'All clubs'}.obs;
  RxSet<String> uclTeams = <String>{'All clubs'}.obs;
  RxBool isLoading = false.obs;
  RxBool isPl = true.obs;
  RxList<TotalFixtures> fixtures = <TotalFixtures>[].obs;
  List<TotalFixtures> dataSource = [];

  @override
  Future<void> onInit() async {
    isLoading.value = true;
    await fetchMatches(
        league: 39,
        dataBase: plMatches,
        shortData: shortPlMatches,
        teamsSet: plTeams);
    fixtures.addAll(shortPlMatches);
    dataSource = plMatches;
    isLoading.value = false;

    super.onInit();
  }

  void sortTeams({required String teamName, required bool isPL}) {
    fixtures.clear();

    if (teamName != 'All clubs') {
      if (isPL == true) {
        sortPl.clear();
        sortPl.addAll(plMatches.where((e) =>
            e.teams?.home?.name == teamName ||
            e.teams?.away?.name == teamName));
        (sortPl.length > 20)
            ? fixtures.addAll(sortPl.take(20))
            : fixtures.addAll(sortPl);
        dataSource = sortPl;
      } else {
        sortUcl.clear();
        sortUcl.addAll(uclMatches.where((e) =>
            e.teams?.home?.name == teamName ||
            e.teams?.away?.name == teamName));
        (sortUcl.length > 20)
            ? fixtures.addAll(sortUcl.take(20))
            : fixtures.addAll(sortUcl);
        dataSource = sortUcl;
      }
    } else {
      if (isPL == true) {
        fixtures.addAll(shortPlMatches);
        dataSource = plMatches;
      } else {
        fixtures.addAll(shortUclMatches);
        dataSource = uclMatches;
      }
    }
  }

  Future<void> fetchMatches(
      {required int league,
      required List<TotalFixtures> dataBase,
      required List<TotalFixtures> shortData,
      required RxSet<String> teamsSet}) async {
    try {
      final response = await service.fetchFixtures(league: league);
      if (response != null) {
        dataBase.addAll(response.fixturesList ?? []);
      }
      if (dataBase.length > 20) {
        shortData.addAll(dataBase.take(20));
        teamsSet.addAll(dataBase.map((e) => e.teams?.home?.name ?? ''));
        teamsSet.addAll(dataBase.map((e) => e.teams?.away?.name ?? ''));
      } else {
        shortData.addAll(dataBase);
        teamsSet.addAll(dataBase.map((e) => e.teams?.home?.name ?? ''));
        teamsSet.addAll(dataBase.map((e) => e.teams?.away?.name ?? ''));
      }
    } catch (e) {
      Get.snackbar('Error', 'Error occur');
    }
  }

  void loadMore(List<TotalFixtures> matchesStorage) {
    if (matchesStorage.length > fixtures.length) {
      if (matchesStorage.length - 10 > fixtures.length) {
        fixtures.addAll(
            matchesStorage.sublist(fixtures.length, fixtures.length + 11));
      } else {
        fixtures.addAll(matchesStorage.sublist(fixtures.length));
      }
    }
  }

  void addCurrentMatch(){

  }

}
