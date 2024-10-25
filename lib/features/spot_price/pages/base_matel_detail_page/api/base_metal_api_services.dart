import 'package:get/get.dart';
import 'package:market_hub_application/core/api/api_services.dart';
import 'package:market_hub_application/core/constants/api_constant.dart';

import '../../../model/spot_response_model.dart';

class BaseMetalApiServices{
  Future<SpotListResponse?> fetchSpotList(String category) async {
    final url = '${ApiConstants.baseUrl}/user/spot-list?category=$category';

    try {
      final response = await BaseApiServices.dio.get(url);

      if (response.statusCode == 200) {
        return SpotListResponse.fromJson(response.data);
      } else {
        // Handle error response
        Get.snackbar('Error', 'Failed to load data: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // Handle exceptions
      Get.snackbar('Error', 'An error occurred: $e');
      return null;
    }
  }
}