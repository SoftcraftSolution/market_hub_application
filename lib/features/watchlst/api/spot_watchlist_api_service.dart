import 'package:get/get.dart';
import '../../../../../core/api/api_services.dart';
import '../../../../../core/constants/api_constant.dart';
import '../../../../../core/utils/userDataCon.dart';
import '../../../../../core/utils/utils.dart';
import '../../future/pages/FX_page/model/fx_model.dart';
import '../../future/pages/SHFE_page/model/shfe_model.dart';
import '../../spot_price/model/item_model.dart';

class WatchListApiService {
  final String _baseUrl = ApiConstants.baseUrl;

  Future<Map<String, dynamic>> fetchWatchlist() async {
    final email = UserDataController.userDetail!.email;
    final url = '$_baseUrl/user/get-watch-list?email=$email';

    try {
      final response = await BaseApiServices.dio.get(url);

      if (response.statusCode == 200) {
        var data = response.data["watchlist"];

        // Parse and map each watchlist category to its respective model
        List<SpotItem> baseMetals = (data['baseMetals'] as List<dynamic>?)
            ?.map((item) => SpotItem.fromJson(item as Map<String, dynamic>))
            .toList() ?? [];
        Print.p("after spot");



        List<SHFE_model> shfeItems = (data['shfe'] as List<dynamic>?)
            ?.map((item) => SHFE_model.fromJson(item as Map<String, dynamic>))
            .toList() ?? [];
        Print.p("after shfe");

        List<Map<String, dynamic>> lmeItems = (data['lme'] as List<dynamic>?)
            ?.cast<Map<String, dynamic>>() ?? [];
        Print.p("after lme");

        List<Map<String, dynamic>> mcxItems = (data['mcx'] as List<dynamic>?)
            ?.cast<Map<String, dynamic>>() ?? [];
        Print.p("after mcx");

        List<FXModel> fxItems = (data['fx'] as List<dynamic>?)
            ?.map((item) => FXModel.fromMap(item as Map<String, dynamic>))
            .toList() ?? [];
        Print.p("after fx");

        return {
          'baseMetals': baseMetals,
          'fx': fxItems,
          'shfe': shfeItems,
          'lme': lmeItems,
          'mcx': mcxItems,
        };
      } else {
        Get.snackbar('Error', 'Failed to fetch watchlist: ${response.statusCode}');
        return {};
      }
    } catch (e) {
      Print.p(" in fetch watch list exception=>${e.toString()}");
      Get.snackbar('Error', 'An error occurred: $e');
      return {};
    }
  }

  // Future<List<SpotItem>> fetchWatchlist() async {
  //   final email = UserDataController.userDetail!.email;
  //   final url = '$_baseUrl/user/get-watch-list?email=$email';
  //
  //   try {
  //     final response = await BaseApiServices.dio.get(url);
  //
  //     if (response.statusCode == 200) {
  //       List<dynamic> data = response.data["watchlist"]['baseMetals'];
  //       return data.map((item) => SpotItem.fromJson(item)).toList();
  //     } else {
  //       Get.snackbar('Error', 'Failed to fetch watchlist: ${response.statusCode}');
  //       return [];
  //     }
  //   } catch (e) {
  //     Print.p(" in fetch watch list exception=>${e.toString()}");
  //     Get.snackbar('Error', 'An error occurred: $e');
  //     return [];
  //   }
  // }

  Future<bool> addItemToWatchlist({List<String>? baseMetalIds,List<String>? fxIds,List<String>? lmeIds,List<String>? mcxIds,List<String>? shfeIds}) async {
    final email = UserDataController.userDetail!.email;
    final url = '$_baseUrl/user/add-watchlist';
    final data = {
      'email': email,
      'baseMetalIds': baseMetalIds??[],
      'fxIds':fxIds??[],
      'lmeIds':lmeIds??[],
      'mcxIds':mcxIds??[],
      'shfeIds':shfeIds??[],
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
