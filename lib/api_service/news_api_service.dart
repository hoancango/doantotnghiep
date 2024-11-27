import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mynewapp/home/news_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NewsApiService {
  final Dio _dio = Dio();
  final DateTime now = DateTime.now();

  NewsApiService() {
    _dio.options.baseUrl = 'https://newsapi.org/';
    _dio.options.queryParameters = {
      'apiKey': 'b3442627d50243078e8f487d15c00201'
    };

    _dio.interceptors.add(PrettyDioLogger());
  }

  //get news them logic null case, nhung de sau de lam logic toan bo cac screen

  Future<News?> fetchNews({
    required String keySearch,
    // required int page,
    bool? trueRelevancyFalsePublishedAt,
  }) async {
    try {
      final response = await _dio.get(
        '/v2/everything',
        queryParameters: {
          'q': keySearch,
          'from': daysBefore(2),
          // 'pageSize': 20,
          'language': 'en',
          'sortBy': sort(trueRelevancyFalsePublishedAt),
          'searchIn': 'title,description',
          // 'page': page,
        },
      );
      if (response.statusCode == 200) {
        try {
          return News.fromJson(response.data as Map<String, dynamic>);
        } catch (_) {
          Get.snackbar('Error', 'Error 1 occur');
          return null;
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Error 2 occur');
      return null;
    }
    return null;
  }

  String daysBefore(int days) {
    DateTime daysBefore = now.subtract(Duration(
      days: days,
    ));

    String formattedDate =
        '${daysBefore.year}-${daysBefore.month.toString().padLeft(2, '0')}-${daysBefore.day.toString().padLeft(2, '0')}';
    return formattedDate;
  }

  String sort(
    bool? trueRelevancyFalsePublishedAt,
  ) {
    String result = 'popularity';

    if (trueRelevancyFalsePublishedAt == true) {
      result = 'relevancy';
    }
    if (trueRelevancyFalsePublishedAt == false) {
      result = 'publishedAt';
    }

    return result;
  }
}
