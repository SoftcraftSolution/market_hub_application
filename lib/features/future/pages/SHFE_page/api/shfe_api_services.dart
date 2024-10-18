// lib/api_service.dart

import 'package:dio/dio.dart';
import 'package:market_hub_application/core/api/api_services.dart';
import 'package:market_hub_application/features/future/pages/SHFE_page/model/shfe_model.dart';


class SHFEPageApiService {
  final String url = 'https://shfe-scrap.vercel.app/api/shfe-prices';
 // Create a Dio instance

  Future<List<SHFE_model>> fetchShfeData() async {
    try {
      final response = await BaseApiServices.dio.get(url); // Use Dio to get data

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = response.data;
        return jsonResponse.map((price) => SHFE_model.fromJson(price)).toList();
      } else {
        throw Exception('Failed to load prices: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load prices: $e'); // Handle errors
    }
  }
}
