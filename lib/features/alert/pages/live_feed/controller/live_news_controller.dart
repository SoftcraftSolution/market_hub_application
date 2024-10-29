import 'dart:async';
import 'package:get/get.dart';
import '../../../../user/naviagtion/controller/navigation_controller.dart';
import '../../../controller/alert_controller.dart';
import '../api/live_feed_api_service.dart';
import '../model/news_model.dart';

class LiveNewsController extends GetxController {
  var newsList = <LiveNewsModel>[].obs;
  var _timer;

  var homeCon = Get.find<HomeCon>();
  var alertCon = Get.find<AlertCon>();
  final LiveFeedApiService apiService = LiveFeedApiService();

  @override
  void onInit() {
    super.onInit();
    startFetchingData();
    everAll([homeCon.pageIndex, alertCon.pageIndex], (_) async {
      if (homeCon.pageIndex.value == 3 && alertCon.pageIndex.value == 0) {
        await startFetchingData();
      } else {
        stopFetchingData();
      }
    });
  }

  Future<void> startFetchingData() async {
    _timer?.cancel();
    await fetchNewsData();
    _timer = Timer.periodic(Duration(seconds: 10), (_) async {
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
