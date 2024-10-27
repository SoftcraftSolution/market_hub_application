import 'dart:async';
import 'package:get/get.dart';
import '../api/live_feed_api_service.dart';
import '../model/news_model.dart';

class NewsController extends GetxController {
  var newsList = <LiveNewsModel>[].obs;
  var _timer;

  final LiveFeedApiService apiService = LiveFeedApiService();

  @override
  void onInit() {
    super.onInit();
    startFetchingData();
  }

  Future<void> startFetchingData() async {
    _timer?.cancel();
    await fetchNewsData();
    _timer = Timer.periodic(Duration(seconds: 16), (_) async {
      await fetchNewsData();
    });
  }

  Future<void> fetchNewsData() async {
    final newsData = await apiService.fetchNews();
    if (newsData.isNotEmpty) {
      newsList.value = newsData.map((item) => LiveNewsModel.fromJson(item)).toList();
    }
  }

  void stopFetchingData() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void onClose() {
    stopFetchingData();
    super.onClose();
  }
}
