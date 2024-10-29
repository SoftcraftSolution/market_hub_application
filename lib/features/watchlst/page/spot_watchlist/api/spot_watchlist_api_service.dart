import 'package:get/get.dart';
import '../../../../../core/api/api_services.dart';
import '../../../../../core/constants/api_constant.dart';
import '../../../../../core/utils/userDataCon.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../spot_price/model/item_model.dart';

class SpotWatchListApiService {
  final String _baseUrl = ApiConstants.baseUrl;

  Future<List<SpotItem>> fetchWatchlist() async {
    final email = UserDataController.userDetail!.email;
    final url = '$_baseUrl/user/get-watch-list?email=$email';

    try {
      final response = await BaseApiServices.dio.get(url);

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['baseMetals'];
        return data.map((item) => SpotItem.fromJson(item)).toList();
      } else {
        Get.snackbar('Error', 'Failed to fetch watchlist: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      Print.p(" in fetch watch list exception=>${e.toString()}");
      Get.snackbar('Error', 'An error occurred: $e');
      return [];
    }
  }

  Future<bool> addItemToWatchlist(String baseMetalId) async {
    final email = UserDataController.userDetail!.email;
    final url = '$_baseUrl/user/add-watchlist';
    final data = {
      'email': email,
      'baseMetalId': baseMetalId,
    };

    try {
      final response = await BaseApiServices.dio.post(url, data: data);

      if (response.statusCode == 201) {
        Get.snackbar('Success', 'Item added to watchlist');
        return true;
      } else {
        Get.snackbar('Error', 'Failed to add item: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      Print.p(" in add watch list exception=>${e.toString()}");
      Get.snackbar('Error', 'An error occurred: $e');
      return false;
    }
  }

  Future<bool> deleteItemFromWatchlist(String id) async {
    final email = UserDataController.userDetail!.email;
    final url = '$_baseUrl/user/delete-watchlist?id=$id&email=$email';

    try {
      final response = await BaseApiServices.dio.delete(url);

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Item removed from watchlist');
        return true;
      } else {
        Get.snackbar('Error', 'Failed to remove item: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      Print.p(" in remove watch list exception=>${e.toString()}");
      Get.snackbar('Error', 'An error occurred: $e');
      return false;
    }
  }
}
