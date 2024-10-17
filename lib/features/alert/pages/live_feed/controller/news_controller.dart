import 'dart:async';
import 'package:get/get.dart';

import '../api/live_feed_api_service.dart';
import '../model/news_model.dart';


class NewsController extends GetxController {
  var newsList = <NewsModel>[].obs;
  late Timer _timer;
  final LiveFeedApiService apiService = LiveFeedApiService();

  @override
  void onInit() {
    super.onInit();
    fetchNewsData();
    _timer = Timer.periodic(Duration(seconds: 30), (_) {
      fetchNewsData(); // Fetch data every 10 seconds
    });
  }

  Future<void> fetchNewsData() async {
    final newsData = await apiService.fetchNews();
    if (newsData.isNotEmpty) {
      newsList.value = newsData.map((item) => NewsModel.fromJson(item)).toList();
    }
  }

  @override
  void onClose() {
    _timer.cancel(); // Stop timer when controller is closed
    super.onClose();
  }
}
