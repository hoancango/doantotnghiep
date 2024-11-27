import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mynewapp/home/footOrg_standings_model.dart';
import 'package:mynewapp/teams_detail/fotorg_teams_detail_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class FootOrgApiService {
  final Dio _dio = Dio();
  FootOrgApiService() {
    _dio.options.baseUrl = 'https://api.football-data.org/';
    _dio.options.headers = {
      'X-Auth-Token': '72ab2f99b74f44bca0d53a487c5a157f',
    };
    _dio.interceptors.add(PrettyDioLogger());
  }

  Future<FotOrgPLStandings?> fetchStandings() async {
    try {
      final response = await _dio.get(
        '/v4/competitions/PL/standings',
        queryParameters: {},
      );

      if (response.statusCode == 200) {
        return FotOrgPLStandings.fromJson(
            response.data as Map<String, dynamic>);
      }
    } catch (e) {
      Get.snackbar('Error', 'Error occur');
    }
    return null;
  }

  Future<TotalTeamsDetails?> fetchTeamInfo({required int id}) async {
    try {
      final response = await _dio.get(
        '/v4/teams/$id',
      );

      if (response.statusCode == 200) {
        return TotalTeamsDetails.fromJson(
            response.data as Map<String, dynamic>);
      }
    } catch (e) {
      Get.snackbar('Error', 'Error occur');
    }
    return null;
  }
}
