import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/features/user/naviagtion/controller/navigation_controller.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../spot_price/model/item_model.dart';
import '../api/spot_watchlist_api_service.dart';

class SpotWatchlistController extends GetxController {
  final SpotWatchListApiService _apiService = SpotWatchListApiService();
  Timer? _timer;

  // Observable list to store watchlist items
  RxList<SpotItem> watchlist = <SpotItem>[].obs;

  // Observable list to store only the IDs of the watchlist items
  RxList<String> watchlistIds = <String>[].obs;

  var homeCon = Get.find<HomeCon>();

  @override
  void onInit() {
    super.onInit();
    startFetchingData(); // Start fetching data when controller initializes

    // Monitor navigation changes and start/stop fetching accordingly
    ever(homeCon.pageIndex, (index) async {
      if (homeCon.pageIndex.value == 4) {
        await startFetchingData(); // Restart fetching when on the target page
      } else {
        stopFetchingData(); // Stop fetching when navigating away
      }
    });
  }

  // Start fetching data periodically
  Future<void> startFetchingData() async {
    Print.p("Started fetching watchlist data");
    _timer?.cancel(); // Cancel any previous timer
    await fetchWatchlistItems(); // Fetch immediately on start

    // Schedule data fetching every 10 seconds
    _timer = Timer.periodic(Duration(seconds: 10), (_) async {
      await fetchWatchlistItems();
    });
  }

  // Stop fetching data
  void stopFetchingData() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
      Print.p("Stopped fetching watchlist data");
    }
  }

  // Fetch watchlist items from the API and update observable lists
  Future<void> fetchWatchlistItems() async {
    try {
      final items = await _apiService.fetchWatchlist();
      watchlist.assignAll(items); // Update watchlist
      watchlistIds.assignAll(items.map((item) => item.id).toList()); // Update IDs
    } catch (e) {
      Print.p("Error fetching watchlist: $e"); // Log errors if any
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
      Print.p("Error adding item to watchlist: $e"); // Log errors if any
    }
  }

  // Remove an item from the watchlist and refresh lists
  Future<void> removeItem(String id) async {
    customToast(msg: "Loading...");
    try {
      final success = await _apiService.deleteItemFromWatchlist(id);
      if (success) {
        await fetchWatchlistItems(); // Refresh the lists on success
      }
    } catch (e) {
      Print.p("Error removing item from watchlist: $e"); // Log errors if any
    }
  }
}
