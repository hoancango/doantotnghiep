import 'package:get/get.dart';
import 'package:mynewapp/api_service/rapid_api_service.dart';
import 'package:mynewapp/home/matches_model.dart';

class MatchesController extends GetxController {
  final RapidFootballService service = RapidFootballService();

  List<TotalFixtures> plMatches = [];
  List<TotalFixtures> uclMatches = [];
  List<TotalFixtures> sortPl = [];
  List<TotalFixtures> sortUcl = [];
  RxList<TotalFixtures> shortPlMatches = <TotalFixtures>[].obs;
  RxList<TotalFixtures> shortUclMatches = <TotalFixtures>[].obs;
  RxSet<String> plTeams = <String>{'Tất cả'}.obs;
  RxSet<String> uclTeams = <String>{'Tất cả'}.obs;
  RxBool isLoading = false.obs;
  RxBool isPl = true.obs;
  RxList<TotalFixtures> fixtures = <TotalFixtures>[].obs;

  @override
  Future<void> onInit() async {
    isLoading.value = true;
    await fetchMatches(
        league: 39,
        dataBase: plMatches,
        shortData: shortPlMatches,
        teamsSet: plTeams);
    fixtures.addAll(shortPlMatches);
    isLoading.value = false;

    super.onInit();
  }

  void sortTeams({required String teamName, required bool isPL}) {
    fixtures.clear();
    if (teamName != 'Tất cả') {
      (isPL == true)
          ? fixtures.addAll(plMatches
              .where((e) =>
                  e.teams?.home?.name == teamName ||
                  e.teams?.away?.name == teamName)
              .toList())
          : fixtures.addAll(uclMatches
              .where((e) =>
                  e.teams?.home?.name == teamName ||
                  e.teams?.away?.name == teamName)
              .toList());
    } else {
      (isPL == true)
          ? fixtures.addAll(shortPlMatches)
          : fixtures.addAll(shortUclMatches);
    }
  }

  Future<void> fetchMatches(
      {required int league,
      required List<TotalFixtures> dataBase,
      required RxList<TotalFixtures> shortData,
      required RxSet<String> teamsSet}) async {
    try {
      final response = await service.fetchFixtures(league: league);
      if (response != null) {
        dataBase.addAll(response.fixturesList ?? []);
      }
      if (dataBase.length > 40) {
        shortData.addAll(dataBase.take(40));
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
}
