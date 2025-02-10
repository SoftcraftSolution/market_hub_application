import 'dart:async';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:market_hub_application/features/alert/pages/circular_page/api/circuler_api_service.dart';
import 'package:market_hub_application/features/alert/pages/self_news/api/self_news_api_services.dart';
import 'package:market_hub_application/features/alert/pages/technical_analysis/api/technical_news_api_service.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../user/naviagtion/controller/navigation_controller.dart';
import '../../../controller/alert_controller.dart';
import '../../../model/news_feed_model.dart';


class CirculerCon extends GetxController {
  RxList<NewsFeedModel> circulerList = <NewsFeedModel>[].obs; // Observable list for news articles
  var _timer;
  var homeCon=Get.find<HomeCon>();
  var alertCon=Get.find<AlertCon>();
  var isLoading=false.obs;
// Instantiate the ApiService

  @override
  void onInit() {
    super.onInit();
    // Fetch news on initialization
    startFetchingData(); // Start periodic fetching of news data
    everAll([homeCon.pageIndex,alertCon.pageIndex],
            (_)async{
          if(homeCon.pageIndex.value==3 && alertCon.pageIndex.value==5){
            await startFetchingData();
          }else{
            stopFetchingData();
          }
        });
  }

  // Fetch news from the API
  Future<void> fetchCirculer() async {
    try {
      isLoading(true);
      List<NewsFeedModel> news = await CirculerApiService().fetchNews();
      Print.p(news.toString());
      circulerList.assignAll(news); // Assign fetched news to observable list
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print('Error fetching news: $e'); // Handle error
    }
  }

  // Start periodic data fetching every 10 seconds
  Future<void> startFetchingData()async {
    Print.p("Stared fetching Circuler data");
    _timer?.cancel();
    await fetchCirculer();
    _timer = Timer.periodic(Duration(seconds: 10), (_) async{
      await fetchCirculer(); // Re-fetch news periodically
    });
  }
  void stopFetchingData()async{
    if(_timer!=null){
      _timer!.cancel();
      _timer=null;
      Print.p("stopped===>Circuler data fetching");
    }
  }

  @override
  void onClose() {
    _timer?.cancel(); // Cancel the timer when the controller is closed
    super.onClose();
  }
}
