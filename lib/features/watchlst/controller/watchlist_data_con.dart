import 'dart:async';
import 'package:get/get.dart';
import '../../../core/utils/utils.dart';
import '../../future/pages/FX_page/model/fx_model.dart';
import '../../future/pages/SHFE_page/model/shfe_model.dart';
import '../../spot_price/model/item_model.dart';
import '../../user/naviagtion/controller/navigation_controller.dart';
import '../api/spot_watchlist_api_service.dart';

class WatchlistDataController extends GetxController {
  final WatchListApiService _apiService = WatchListApiService();
  Timer? _timer;

  // Observable lists for each watchlist category
  RxList<SpotItem> spotWatchList = <SpotItem>[].obs;
  RxList<FXModel> fxWatchList = <FXModel>[].obs;
  RxList<Map<String, dynamic>> lmeWatchList = <Map<String, dynamic>>[].obs;  // Using Map for LME
  RxList<Map<String, dynamic>> mcxWatchList = <Map<String, dynamic>>[].obs;  // Using Map for MCX
  RxList<SHFE_model> shfeWatchList = <SHFE_model>[].obs;

  // Observable lists for watchlist IDs
  RxList<String> spotWatchlistIds = <String>[].obs;
  RxList<String> fxWatchlistIds = <String>[].obs;
  RxList<String> lmeWatchlistIds = <String>[].obs;
  RxList<String> mcxWatchlistIds = <String>[].obs;
  RxList<String> shfeWatchlistIds = <String>[].obs;

  var homeCon = Get.find<HomeCon>();

  @override
  void onInit() {
    super.onInit();
    startFetchingData();

    ever(homeCon.pageIndex, (index) async {
      if (homeCon.pageIndex.value == 4) {
        await startFetchingData();
      } else {
        stopFetchingData();
      }
    });
  }

  Future<void> startFetchingData() async {
    Print.p("Started fetching watchlist data");
    _timer?.cancel();
    await fetchWatchlistItems();

    _timer = Timer.periodic(Duration(seconds: 10), (_) async {
      await fetchWatchlistItems();
    });
  }

  void stopFetchingData() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
      Print.p("Stopped fetching watchlist data");
    }
  }

  Future<void> fetchWatchlistItems() async {
    try {
      final items = await _apiService.fetchWatchlist();

      // Explicitly casting each list to ensure type safety
      spotWatchList.assignAll((items["baseMetals"]));
      Print.p("spot data length==>\n${spotWatchList.value.length}");

      fxWatchList.assignAll((items["fx"]));
      Print.p("fx data length==>\n${fxWatchList.value.length}");


      lmeWatchList.assignAll((items["lme"].toList()));
      Print.p("lme data length==>\n${lmeWatchList.value.length}");

      // Directly assigning as list of maps
      mcxWatchList.assignAll((items["mcx"].toList()));
      Print.p("mcx data length==>\n${mcxWatchList.value.length}");

      // Directly assigning as list of maps
      shfeWatchList.assignAll((items["shfe"]));
      Print.p("shfe data length==>\n${shfeWatchList.value.length}");

      // Update each category's ID list
      spotWatchlistIds.assignAll(spotWatchList.map((item) => item.id).toList());
      fxWatchlistIds.assignAll(fxWatchList.map((item) => item.id).toList());
      lmeWatchlistIds.assignAll(lmeWatchList.map((item) => item["_id"].toString()).toList());
      mcxWatchlistIds.assignAll(mcxWatchList.map((item) => item["_id"].toString()).toList());
      shfeWatchlistIds.assignAll(shfeWatchList.map((item) => item.id).toList());

    } catch (e) {
      Print.p("Error fetching watchlist: $e");
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }


  Future<void> addItem({
    List<String>? baseMetalIds,
    List<String>? fxIds,
    List<String>? lmeIds,
    List<String>? mcxIds,
    List<String>? shfeIds,
  }) async {
    customToast(msg: "Loading...");
    try {
      final success = await _apiService.addItemToWatchlist(
        baseMetalIds: baseMetalIds,
        fxIds: fxIds,
        lmeIds: lmeIds,
        mcxIds: mcxIds,
        shfeIds: shfeIds,
      );
      if (success) {
        await fetchWatchlistItems(); // Refresh the lists on success
      }
    } catch (e) {
      Print.p("Error adding item to watchlist: $e");
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }

  Future<void> removeItem(String id) async {
    customToast(msg: "Loading...");
    try {
      final success = await _apiService.deleteItemFromWatchlist(id);
      if (success) {
        await fetchWatchlistItems(); // Refresh the lists on success
      }
    } catch (e) {
      Print.p("Error removing item from watchlist: $e");
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }

  // Group the spotWatchList items by category, type, and subcategory for structured display
  Map<String, List<SpotItem>> groupWatchlistByCategory() {
    Map<String, List<SpotItem>> groupedData = {};

    for (var item in spotWatchList) {
      // Create a unique key for grouping (category-type-subcategory)
      String key = "${item.category}-${item.type}-${item.subcategory}";

      if (!groupedData.containsKey(key)) {
        groupedData[key] = [];
      }
      groupedData[key]!.add(item);
    }

    return groupedData;
  }
  @override
  void onClose() {
    // TODO: implement onClose
    stopFetchingData();
    super.onClose();
  }
}
