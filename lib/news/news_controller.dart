import 'package:get/get.dart';
import 'package:mynewapp/api_service/news_api_service.dart';
import 'package:mynewapp/home/news_model.dart';

class NewsController extends GetxController {
  NewsApiService service = NewsApiService();
  List<Articles> plNews = <Articles>[].obs;
  List<Articles> favTeamNews = <Articles>[].obs;
  List<Articles> transferNews = <Articles>[].obs;
  RxList<Articles> shortPlNews = <Articles>[].obs;
  RxList<Articles> shortFavNews = <Articles>[].obs;
  RxList<Articles> shortTransferNews = <Articles>[].obs;
  RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    isLoading.value = true;
    await getNewsByPublishedAt(
      'premier league',
      plNews,
      shortPlNews,
    );
    await getNewsByPublishedAt(
      'manchester united',
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

  Future<void> getNewsByPublishedAt(String keySearch,
      List<Articles> newsStorage, RxList<Articles> shortTermStorage) async {
    try {
      final response = await service.fetchNews(
        keySearch: keySearch,
        // page: 1,
        trueRelevancyFalsePublishedAt: false,
      );

      if (response != null) {
        newsStorage.addAll(response.articles?.where((article) => !article.hasNullValues()) ?? []);
      }

      if (newsStorage.length > 10) {
        shortTermStorage.addAll(newsStorage.take(10));
      } else {
        shortTermStorage.addAll(newsStorage);
      }
    } catch (e) {
      Get.snackbar('Error', 'Error Occur');
    }
  }

}
