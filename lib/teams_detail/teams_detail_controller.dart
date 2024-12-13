
import 'package:get/get.dart';
import 'package:mynewapp/api_service/footorg_api_service.dart';
import 'package:mynewapp/teams_detail/fotorg_teams_detail_model.dart';
import 'package:mynewapp/teams_detail/rapid_teamSquad_model.dart';

import '../api_service/rapid_api_service.dart';

class TeamsInfoController extends GetxController{
  final FootOrgApiService _orgService = FootOrgApiService();
  final RapidFootballService _rapidService = RapidFootballService();
  Rx<TotalTeamsDetails> teamData = TotalTeamsDetails().obs;
  List<Players>? teamSquad = <Players>[];
  RxList<Players> goalKeepers = <Players>[].obs;
  RxList<Players> defenders = <Players>[].obs;
  RxList<Players> midfielder = <Players>[].obs;
  RxList<Players> attackers = <Players>[].obs;
  // RxBool isLoading = false.obs;
  late int orgTeamId;
  late int rapidTeamId;



  @override
  Future<void> onInit() async {
    // isLoading.value = true;
    orgTeamId = Get.arguments['orgTeamId'];
    rapidTeamId = Get.arguments['rapidTeamId'];
    await fetchTeamInfo(id: orgTeamId);
    await fetchTeamSquads(id: rapidTeamId);
    positionFilter();
    // isLoading.value = false;
    super.onInit();
  }

  void positionFilter(){
    goalKeepers.addAll(teamSquad?.where((player) => player.position?.toLowerCase().contains("goalkeeper") ?? false) ?? []);
    defenders.addAll(teamSquad?.where((player) => player.position?.toLowerCase().contains("defender") ?? false) ?? []);
    midfielder.addAll(teamSquad?.where((player) => player.position?.toLowerCase().contains("midfielder") ?? false) ?? []);
    attackers.addAll(teamSquad?.where((player) => player.position?.toLowerCase().contains("attacker") ?? false) ?? []);
  }


  Future<void> fetchTeamInfo({required int id}) async {
    final response = await _orgService.fetchTeamInfo(id: id);

    if(response != null){
      teamData.value = response;
    }else{
      Get.snackbar('Error', 'Error occur');
    }
  }

  Future<void> fetchTeamSquads({required int id}) async {
    final response = await _rapidService.fetchTeamSquads(id: id);
    if(response != null){
      teamSquad = response.squadsInfo?[0].players ?? [];
    }else{
      Get.snackbar('Error', 'Error occur');
    }
  }

}