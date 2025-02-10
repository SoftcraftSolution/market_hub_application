// lib/services/api_service.dart
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:market_hub_application/core/api/api_services.dart';

import '../../../model/news_feed_model.dart';

class SelfNewsApiService {

// Initialize Dio instance

  Future<List<NewsFeedModel>> fetchNews() async {
    try {
      final response = await BaseApiServices.dio.get("https://admin.markethubindia.com/admin/get-self-news"); // Use Dio to make the GET request

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.data['data']; // Access data from response
        return jsonData.map((newsJson) => NewsFeedModel.fromJson(newsJson)).toList().reversed.toList();
      } else {
        throw Exception('Failed to load news: ${response.statusCode}');
      }
    } on DioError catch (e) {
      throw Exception('Failed to load news: ${e.response?.statusCode} ${e.message}');
    }
  }
}
