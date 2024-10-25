import 'package:dio/dio.dart';
import 'package:market_hub_application/core/api/api_services.dart';
import 'package:market_hub_application/core/constants/api_constant.dart';
import 'dart:convert';
import '../model/warehouse_model.dart';

class WarehouseApiService {
  final String endpoint = 'https://markethub-app-backend.onrender.com/user/get-lme-warehouse';


  Future<LmeWarehouseData> fetchLmeWarehouseData() async {
    try {
      final response = await BaseApiServices.dio.get("${ApiConstants.baseUrl}/user/get-lme-warehouse");

      if (response.statusCode == 200) {
        // Assuming the response is JSON and contains the 'data' key.
        final data = response.data;
        return LmeWarehouseData.fromJson(data['data'][0]);
      } else {
        throw Exception('Failed to load data with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
