import 'package:get/get.dart';
import 'package:market_hub_application/features/future/pages/LME_Page/controller/lmePageController.dart';

import '../../../../../core/api/api_services.dart';

class LMEAPiService{
  Future<List> fetchLMEData() async {
    try {

      final response = await BaseApiServices.dio.get('https://lme-scrap.vercel.app/api/lme-metal-data');
      if (response.statusCode == 200) {
        return response.data; // Update the observable list
      } else {
        print('Failed to load data: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error: $e');
      return  [];
    }
  }
}