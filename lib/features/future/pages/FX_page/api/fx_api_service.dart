import 'package:market_hub_application/core/api/api_services.dart';
import 'package:html/parser.dart' as html;

import '../model/fx_model.dart';
class FXApiServices {



  Future<List<FXModel>> fetchForwardRates() async {



    try {
      final response = await BaseApiServices.dio.get("https://fx-scrap.onrender.com/forward-rates");

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = response.data;
        if (jsonResponse['success']) {
          final List<dynamic> data = jsonResponse['data'];
          return data.map((item) => FXModel.fromMap(item)).toList();
        } else {
          throw Exception('Failed to load data');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }



}



