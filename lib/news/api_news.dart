

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService{
  final Dio _dio = Dio();

  DateTime now = DateTime.now();


  // DateTime yesterday = now.subtract(Duration(days: 1));


  ApiService(){
    _dio.options.baseUrl = 'https://newsapi.org/';
    _dio.options.queryParameters = {
      'apiKey': 'b3442627d50243078e8f487d15c00201',
    } ;
    _dio.interceptors.add(PrettyDioLogger()); //??

  }




  // Future<TotalFoodResponse?> fetchRecipes({
  //   required int currentSize,
  //   required int skipSize,
  // }) async {
  //   try {
  //     final response = await _dio.get('/recipes/complexSearch', queryParameters: {
  //       'number': currentSize,
  //       'offSet': skipSize,
  //     });
  //     if (response.statusCode == 200) {
  //       try {
  //         return TotalFoodResponse.fromJson(response.data as Map<String, dynamic>);
  //       } catch (_) {
  //         return null;
  //       }
  //     }
  //   } catch (e) {
  //     return null;
  //   }
  //   return null;
  //
  // }



}