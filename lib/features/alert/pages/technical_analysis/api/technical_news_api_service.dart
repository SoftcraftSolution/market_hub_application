// lib/services/api_service.dart
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:market_hub_application/core/api/api_services.dart';

import '../../../../../core/utils/utils.dart';
import '../../../model/news_feed_model.dart';

class TechnicalNewsApiService {

// Initialize Dio instance

  Future<List<NewsFeedModel>> fetchNews() async {
    try {
      final response = await BaseApiServices.dio.get("https://admin.markethubindia.com/admin/get-technical-news"); // Use Dio to make the GET request

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.data['data'];
        // Access data from response
        var finalData= jsonData.map((newsJson) => NewsFeedModel.fromJson(newsJson)).toList().reversed.toList();
        // Print.p("final data=?$finalData");
        return finalData;
      } else {
        throw Exception('Failed to load news: ${response.statusCode}');
      }
    } on DioError catch (e) {
      throw Exception('Failed to load news: ${e.response?.statusCode} ${e.message}');
    }
  }
}
