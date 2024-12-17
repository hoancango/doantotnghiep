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
  int currentTopIndex = 0;
  int currentBottomIndex = 0;
  int currentTopUclIndex = 0;
  int currentTopPlIndex = 0;

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
      manageData(dataBase: dataBase, shortData: shortData);


      // final index =
      //     dataBase.indexWhere((e) => isAfterNow(e.fixture?.date ?? ''));
      //
      // if (dataBase.length <= 20) {
      //   shortData.addAll(dataBase);
      // } else {
      //   if (index < 0) {
      //     shortData.addAll(dataBase.sublist(dataBase.length - 20));
      //     currentTopIndex = dataBase.length - 20;
      //     currentBottomIndex = dataBase.length - 1;
      //   } else {
      //     if (index < 10) {
      //       shortData.addAll(dataBase.sublist(0, index + 10));
      //       currentTopIndex = 0;
      //       currentBottomIndex = index + 9;
      //     } else {
      //       if (index > dataBase.length - 11) {
      //         shortData.addAll(dataBase.sublist(index - 10));
      //         currentTopIndex = index - 10;
      //         currentBottomIndex = dataBase.length - 1;
      //       } else {
      //         shortData.addAll(dataBase.sublist(index - 9, index + 10));
      //         currentTopIndex = index - 9;
      //         currentBottomIndex = index + 9;
      //       }
      //     }
      //   }
      // }

      teamsSet.addAll(dataBase.map((e) => e.teams?.home?.name ?? ''));
      teamsSet.addAll(dataBase.map((e) => e.teams?.away?.name ?? ''));
    } catch (e) {
      Get.snackbar('Error', 'Error occur');
    }
  }

  void loadMore(List<TotalFixtures> matchesStorage) {
    // if (matchesStorage.length > fixtures.length) {
    //   if (matchesStorage.length - 10 > fixtures.length) {
    //     fixtures.addAll(
    //         matchesStorage.sublist(fixtures.length, fixtures.length + 10));
    //   } else {
    //     fixtures.addAll(matchesStorage.sublist(fixtures.length));
    //   }
    // }

    if (currentBottomIndex < matchesStorage.length - 1) {
      if (currentBottomIndex < matchesStorage.length - 20) {
        fixtures.addAll(matchesStorage.sublist(
            currentBottomIndex + 1, currentBottomIndex + 21));
        currentBottomIndex = currentBottomIndex + 20;
      } else {
        fixtures.addAll(matchesStorage.sublist(currentBottomIndex + 1));
        currentBottomIndex = matchesStorage.length - 1;
      }
    }
  }

  void loadMoreOnTop(List<TotalFixtures> matchesStorage) {
    if (currentTopIndex > 0) {
      if (currentTopIndex > 19) {
        fixtures.insertAll(
            0, matchesStorage.sublist(currentTopIndex - 20, currentTopIndex));
        currentTopIndex = currentTopIndex - 20;
      } else {
        fixtures.insertAll(0, matchesStorage.sublist(0, currentTopIndex));
        currentTopIndex = 0;
      }
    }
  }

  bool isAfterNow(String timeString) {
    try {
      DateTime targetTime = DateTime.parse(timeString).toLocal();
      DateTime now = DateTime.now();
      return targetTime.isAfter(now);
    } catch (e) {
      return false;
    }
  }

  void manageData({
    required List<TotalFixtures> dataBase,
    required List<TotalFixtures> shortData,
  }) {
    shortData.clear();
    final index = dataBase.indexWhere((e) => isAfterNow(e.fixture?.date ?? ''));

    if (dataBase.length <= 20) {
      shortData.addAll(dataBase);
    } else {
      if (index < 0) {
        shortData.addAll(dataBase.sublist(dataBase.length - 20));
        currentTopIndex = dataBase.length - 20;
        currentBottomIndex = dataBase.length - 1;
      } else {
        if (index < 10) {
          shortData.addAll(dataBase.sublist(0, index + 10));
          currentTopIndex = 0;
          currentBottomIndex = index + 9;
        } else {
          if (index > dataBase.length - 11) {
            shortData.addAll(dataBase.sublist(index - 10));
            currentTopIndex = index - 10;
            currentBottomIndex = dataBase.length - 1;
          } else {
            shortData.addAll(dataBase.sublist(index - 9, index + 10));
            currentTopIndex = index - 9;
            currentBottomIndex = index + 9;
          }
        }
      }
    }
  }
}
