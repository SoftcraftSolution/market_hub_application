
import 'package:market_hub_application/core/api/api_services.dart';

import '../model/settelment_model.dart';

class SettlementService {
  Future<List<Settlement>> fetchSettlements() async {
    try {
      final response = await BaseApiServices.dio.get(
        'https://market-hub-api-app.vercel.app/user/get-settlement-cash',
      );

      if (response.statusCode == 200) {
        // Parse cashData
        final cashData = (response.data['cashData'] as List)
            .map((item) => Settlement.fromApiJson(item, 'cash'))
            .toList();

        // Parse settlement3MData
        final threeMData = (response.data['settlement3MData'] as List)
            .map((item) => Settlement.fromApiJson(item, '3m'))
            .toList();

        // Combine both datasets into a unified list
        for (var settlement in threeMData) {
          final matchingCash = cashData.firstWhere(
                (cash) => cash.symbol == settlement.symbol,
            orElse: () => Settlement.empty(),
          );
          settlement.cash = matchingCash.cash; // Assign cash data
        }

        return threeMData; // Use threeMData as the base list
      } else {
        throw Exception('Failed to load settlements');
      }
    } catch (e) {
      throw Exception('Error fetching settlement data: $e');
    }
  }
}
