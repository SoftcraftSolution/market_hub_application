// services/settlement_service.dart

import 'package:dio/dio.dart';
import 'package:market_hub_application/core/api/api_services.dart';
import 'package:market_hub_application/core/constants/api_constant.dart';
import '../model/settelment_model.dart';

class SettlementService {


  Future<List<Settlement>> fetchSettlements() async {
    final response = await BaseApiServices.dio.get('${ApiConstants.baseUrl}/user/get-settlement-cash');
    if (response.statusCode == 200) {
      return (response.data['settlements'] as List)
          .map((settlement) => Settlement.fromJson(settlement))
          .toList();
    } else {
      throw Exception('Failed to load settlements');
    }
  }
}
