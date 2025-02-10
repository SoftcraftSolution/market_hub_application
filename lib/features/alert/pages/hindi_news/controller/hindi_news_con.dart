import 'dart:async';
import 'package:get/get.dart';
import '../../../model/news_feed_model.dart';
import '../api_service/api_service_hindi_news.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../user/naviagtion/controller/navigation_controller.dart';
import '../../../controller/alert_controller.dart';

class SelfHindiNewsController extends GetxController {
  RxList<NewsFeedModel> newsList = <NewsFeedModel>[].obs;
  var isLoading=false.obs;
  var _timer;
  var homeCon = Get.find<HomeCon>();
  var alertCon = Get.find<AlertCon>();

  @override
  void onInit() {
    super.onInit();
    startFetchingData();

    everAll([homeCon.pageIndex, alertCon.pageIndex], (_) async {
      if (homeCon.pageIndex.value == 3 && alertCon.pageIndex.value == 2) {
        await startFetchingData();
      } else {
        stopFetchingData();
      }
    });
  }

  Future<void> fetchNews() async {
    try {
      isLoading(true);
      List<NewsFeedModel> news = await SelfHindiNewsApiService().fetchNews();
      newsList.assignAll(news);
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print('Error fetching Hindi news: $e');
    }
  }

  Future<void> startFetchingData() async {
    Print.p("Started fetching Hindi news data");
    _timer?.cancel();
    await fetchNews();
    _timer = Timer.periodic(Duration(seconds: 10), (_) async {
      await fetchNews();
    });
  }

  void stopFetchingData() async {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
      Print.p("Stopped fetching Hindi news");
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
