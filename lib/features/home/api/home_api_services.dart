// lib/services/api_service.dart
import 'package:dio/dio.dart';
import 'package:market_hub_application/core/api/api_services.dart';
import '../model/home_updates_model.dart';

class HomeApiService {

  Future<List<HomeUpdate>> fetchHomeUpdates() async {
    try {
      final response = await BaseApiServices.dio.get('https://market-hub-api-app.vercel.app/user/get-home-update');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['homeUpdates'];
        return data.map((json) => HomeUpdate.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load updates');
      }
    } catch (e) {
      throw Exception('Failed to load updates: $e');
    }
  }
}
