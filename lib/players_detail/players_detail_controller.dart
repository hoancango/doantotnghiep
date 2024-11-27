
import 'package:get/get.dart';
import 'package:mynewapp/api_service/rapid_api_service.dart';
import 'package:mynewapp/players_detail/players_details_model.dart';

class PlayersInfoController extends GetxController{
  final RapidFootballService _service = RapidFootballService();
  Rx<TotalPlayer?> playerData = TotalPlayer().obs;
  Rx<Statistics?> statistics = Statistics().obs;
  List<String> imageLeagues = [];
  List<String> leaguesNames = <String>[].obs;
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = false.obs;
  late int rapidPlayerId;

  @override
  Future<void> onInit() async {
    rapidPlayerId = Get.arguments['rapidPlayerId'];
    await fetchPlayerInfo(id: rapidPlayerId);

    super.onInit();

  }

  // void dataFilter(){
  //   leaguesNames.addAll(playerData.value?.statistics?.map((e) => e.league?.name ?? '') ?? []);
  //   imageLeagues.addAll(playerData.value?.statistics?.map((e) => e.league?.logo ?? '') ?? []);
  // }


  Future<void> fetchPlayerInfo({required int id}) async {
    isLoading.value = true;

      final response = await _service.fetchPlayersDetails(id: id);

    if(response != null){
      playerData.value = response.totalPlayer?[0];
      leaguesNames.addAll(playerData.value?.statistics?.map((e) => '${e.league?.name} ${e.league?.season}' ?? '') ?? []);
      imageLeagues.addAll(playerData.value?.statistics?.map((e) => e.league?.logo ?? '') ?? []);
    }else{
      Get.snackbar('Error', 'Error occur');
    }

    isLoading.value = false;
  }
}