import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mynewapp/home/currentRounds_model.dart';
import 'package:mynewapp/home/matches_model.dart';
import 'package:mynewapp/matches_detail/head_to_head_model.dart';
import 'package:mynewapp/matches_detail/match_statistics_model.dart';
import 'package:mynewapp/players_detail/players_details_model.dart';
import 'package:mynewapp/teams_detail/fotorg_teams_detail_model.dart';
import 'package:mynewapp/teams_detail/rapid_teamSquad_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RapidFootballService {
  final Dio _dio = Dio();

  RapidFootballService() {
    _dio.options.baseUrl = 'https://api-football-v1.p.rapidapi.com/';
    _dio.options.headers = {
      'x-rapidapi-host': 'api-football-v1.p.rapidapi.com',
      'x-rapidapi-key': '4ac2cc002bmsha23b836a57123e1p1573c8jsn103a079e1718'
    };
    _dio.interceptors.add(PrettyDioLogger());
  }

//dung rapidApi

  Future<PLFixtures?> fetchFixtures({String? currentRound, required int league}) async {
    try {
      final response = await _dio.get(
        '/v3/fixtures',
        queryParameters: {
          'league': league,
          'season': 2024,
          if (currentRound != null) 'round': currentRound,
        },
      );
      if (response.statusCode == 200) {
        return PLFixtures.fromJson(response.data as Map<String, dynamic>);
      }
    } catch (e) {
      Get.snackbar('Error', 'Error occur: $e');
    }
    return null;
  }

  Future<PLCurrentRound?> fetchCurrentRound({int league = 39}) async {


    try {
      final response = await _dio.get(
        '/v3/fixtures/rounds',
        queryParameters: {
          'league': league,
          'season': 2024,
          'current': true,
          'dates': true,
        },
      );

      if (response.statusCode == 200) {
        return PLCurrentRound.fromJson(response.data as Map<String, dynamic>);
      }
    } catch (e) {
      Get.snackbar('Error', 'Error occur: $e');
    }
    return null;
  }

  Future<TotalPlayersDetails?> fetchPlayersDetails({required int id}) async {
    try {
      final response = await _dio.get(
        '/v3/players',
        queryParameters: {
          'id': id,
          'season':2024,
        },
      );

      if (response.statusCode == 200) {
        return TotalPlayersDetails.fromJson(
            response.data as Map<String, dynamic>);
      }
    } catch (e) {
      Get.snackbar('Error', 'Error Occur');
    }
    return null;
  }

  Future<TotalTeamSquads?> fetchTeamSquads({required int id}) async {
    try {
      final response = await _dio.get(
        '/v3/players/squads',
        queryParameters: {
          'team': id,
        },
      );
      if(response.statusCode == 200){
        return TotalTeamSquads.fromJson(response.data as Map<String, dynamic>);
      }

    } catch (e) {
      Get.snackbar('Error', 'Error occur');
    }
    return null;
  }

  Future<MatchStatistics?> fetchMatchesDetail({required int id}) async {
    try {
      final response = await _dio.get(
        '/v3/fixtures/statistics',
        queryParameters: {
          'fixture': id,
        },
      );
      if(response.statusCode == 200){
        return MatchStatistics.fromJson(response.data as Map<String, dynamic>);
      }

    } catch (e) {
      Get.snackbar('Error', 'Error occur fetchMatchesDetail');
      print('KET QUA LA $e');
    }
    return null;
  }

  Future<HeadToHead?> fetchHeadToHead({required int homeTeamId, required awayTeamId}) async {
    try {
      final response = await _dio.get(
        '/v3/fixtures/headtohead',
        queryParameters: {
          'h2h': '$homeTeamId-$awayTeamId',
        },
      );
      if(response.statusCode == 200){
        return HeadToHead.fromJson(response.data as Map<String, dynamic>);
      }

    } catch (e) {
      Get.snackbar('Error', 'Error occur fetchHeadToHead');
      print('KET QUA LA $e');
    }
    return null;
  }

  // Future<TotalTeamsDetails?> fetchTeamsDetails() async {
  //   try {
  //     final response = await _dio.get(
  //       '',
  //       queryParameters: {},
  //     );
  //
  //     if (response.statusCode == 200) {
  //       return TotalTeamsDetails.fromJson(
  //           response.data as Map<String, dynamic>);
  //     }
  //   } catch (e) {
  //     Get.snackbar('Error', 'Error Occur');
  //   }
  //   return null;
  // }


}
