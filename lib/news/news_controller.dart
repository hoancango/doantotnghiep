import 'package:get/get.dart';
import 'package:mynewapp/api_service/news_api_service.dart';
import 'package:mynewapp/home/news_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsController extends GetxController {
  late SharedPreferences prefs;
  NewsApiService service = NewsApiService();
  List<Articles> plNews = <Articles>[].obs;
  List<Articles> favTeamNews = <Articles>[].obs;
  List<Articles> transferNews = <Articles>[].obs;
  RxList<Articles> shortPlNews = <Articles>[].obs;
  RxList<Articles> shortFavNews = <Articles>[].obs;
  RxList<Articles> shortTransferNews = <Articles>[].obs;
  RxBool isLoading = false.obs;
  Rxn<String> teamCodeChoice = Rxn<String>();
  String? teamNewsChoice;

  @override
  Future<void> onInit() async {
    isLoading.value = true;
    prefs = await SharedPreferences.getInstance();
    teamNewsChoice = prefs.getString('teamNewsChoice');
    teamCodeChoice.value = prefs.getString('teamCodeChoice');
    await getNewsByPublishedAt(
      'premier league',
      plNews,
      shortPlNews,
    );
    await getNewsByPublishedAt(
      teamNewsChoice,
      favTeamNews,
      shortFavNews,
    );
    await getNewsByPublishedAt(
      'premier league AND transfer',
      transferNews,
      shortTransferNews,
    );
    isLoading.value = false;

    super.onInit();
  }

  Future<void> getNewsByPublishedAt(String? keySearch,
      List<Articles> newsStorage, RxList<Articles> shortTermStorage) async {
    try {
      News? response;
      if(keySearch != null){
       response = await service.fetchNews(
        keySearch: keySearch,
        // page: 1,
        trueRelevancyFalsePublishedAt: false,
      );
      }

      if (response != null) {
        newsStorage.clear();
        newsStorage.addAll(
            response.articles?.where((article) => !article.hasNullValues()) ??
                []);
      }

      if (newsStorage.length > 10) {
        shortTermStorage.clear();
        shortTermStorage.addAll(newsStorage.take(10));
      } else {
        shortTermStorage.clear();
        shortTermStorage.addAll(newsStorage);
      }
    } catch (e) {
      Get.snackbar('Error', 'Error Occur');
    }
  }

  void loadMore(List<Articles> newsStorage, RxList<Articles> shortStorage) {
    if (newsStorage.length > shortStorage.length) {
      if (newsStorage.length - 10 > shortStorage.length) {
        shortStorage.addAll(
            newsStorage.sublist(shortStorage.length, shortStorage.length + 10));
      } else {
        shortStorage.addAll(newsStorage.sublist(shortStorage.length));
      }
    }
  }


}
