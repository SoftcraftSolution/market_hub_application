import 'package:dio/dio.dart';
import 'package:market_hub_application/core/api/api_services.dart';
import '../model/fx_model.dart';

class FXApiServices {
  Future<List<FXModel>> fetchFXData() async {
    const url = 'http://fx.markethubindia.com/api/currencies';
    try {
      final response = await BaseApiServices.dio.get(url);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((item) => FXModel.fromMap(item)).toList();
      } else {
        throw Exception('Failed to load FX data');
      }
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }
}
