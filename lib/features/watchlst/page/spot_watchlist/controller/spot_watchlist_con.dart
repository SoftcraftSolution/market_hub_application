import 'dart:async';
import 'package:get/get.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../spot_price/model/item_model.dart';
import '../../../../user/naviagtion/controller/navigation_controller.dart';
import '../api/spot_watchlist_api_service.dart';

class SpotWatchlistController extends GetxController {
  final SpotWatchListApiService _apiService = SpotWatchListApiService();
  Timer? _timer;

  // Observable lists for the watchlist and their IDs
  RxList<SpotItem> watchlist = <SpotItem>[].obs;
  RxList<String> watchlistIds = <String>[].obs;

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
      watchlist.assignAll(items);
      watchlistIds.assignAll(items.map((item) => item.id).toList());
    } catch (e) {
      Print.p("Error fetching watchlist: $e");
    }
  }

  Future<void> addItem(String baseMetalId) async {
    customToast(msg: "Loading...");
    try {
      final success = await _apiService.addItemToWatchlist(baseMetalId);
      if (success) {
        await fetchWatchlistItems(); // Refresh the lists on success
      }
    } catch (e) {
      Print.p("Error adding item to watchlist: $e");
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
    }
  }

  // Group the watchlist items by category, type, and subcategory
  Map<String, List<SpotItem>> groupWatchlistByCategory() {
    Map<String, List<SpotItem>> groupedData = {};

    for (var item in watchlist) {
      // Create a unique key for grouping (category-type-subcategory)
      String key = "${item.category}-${item.type}-${item.subcategory}";

      if (!groupedData.containsKey(key)) {
        groupedData[key] = [];
      }
      groupedData[key]!.add(item);
    }

    return groupedData;
  }

}
