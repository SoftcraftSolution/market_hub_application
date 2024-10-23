import 'dart:async';
import 'package:get/get.dart';
import 'package:market_hub_application/features/alert/controller/alert_controller.dart';
import 'package:market_hub_application/features/user/naviagtion/controller/navigation_controller.dart';

import '../../../../../core/utils/utils.dart';
import '../api/live_feed_api_service.dart';
import '../model/news_model.dart';


class NewsController extends GetxController {
  var newsList = <LiveNewsModel>[].obs;
  var _timer;
  var homeCon=Get.find<HomeCon>();
  var alertCon=Get.find<AlertCon>();

  final LiveFeedApiService apiService = LiveFeedApiService();

  @override
  void onInit() {
    super.onInit();
    everAll([homeCon.pageIndex,alertCon.pageIndex],
            (_)async{
          if(homeCon.pageIndex.value==3 && alertCon.pageIndex.value==2){
            await startFetchingData();
          }else{
            stopFetchingData();
          }
        });
    startFetchingData();
  }
  Future<void> startFetchingData() async{
    Print.p("Stared fetching Live Feed data");
    _timer?.cancel();
    await fetchNewsData();
    // lme_data.value=await LMEFutureApiService().fetchLMEData(); // Fetch data immediately on start
    // Schedule to fetch data every 10 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (_) async{
      await fetchNewsData();
    });
  }
  Future<void> fetchNewsData() async {
    final newsData = await apiService.fetchNews();
    if (newsData.isNotEmpty) {
      newsList.value = newsData.map((item) => LiveNewsModel.fromJson(item)).toList();
    }
  }
  void stopFetchingData()async{
    if(_timer!=null){
      _timer!.cancel();
      _timer=null;
      Print.p("stopped===>Live Feed data fetching");
    }
  }

  @override
  void onClose() {
    _timer.cancel(); // Stop timer when controller is closed
    super.onClose();
  }
}
