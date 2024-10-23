import 'dart:async';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:market_hub_application/features/alert/pages/self_news/api/self_news_api_services.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../user/naviagtion/controller/navigation_controller.dart';
import '../../../controller/alert_controller.dart';
import '../model/news_model.dart';


class SelfNewsController extends GetxController {
  RxList<SelfNewsModel> newsList = <SelfNewsModel>[].obs; // Observable list for news articles
  var _timer;
  var homeCon=Get.find<HomeCon>();
  var alertCon=Get.find<AlertCon>();
// Instantiate the ApiService

  @override
  void onInit() {
    super.onInit();
    // Fetch news on initialization
    startFetchingData(); // Start periodic fetching of news data
    everAll([homeCon.pageIndex,alertCon.pageIndex],
            (_)async{
          if(homeCon.pageIndex.value==3 && alertCon.pageIndex.value==1){
            await startFetchingData();
          }else{
            stopFetchingData();
          }
        });
  }

  // Fetch news from the API
  Future<void> fetchNews() async {
    try {
      List<SelfNewsModel> news = await SelfNewsApiService().fetchNews();
      newsList.assignAll(news); // Assign fetched news to observable list
    } catch (e) {
      print('Error fetching news: $e'); // Handle error
    }
  }

  // Start periodic data fetching every 10 seconds
  Future<void> startFetchingData()async {
    Print.p("Stared fetching self neews data");
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 10), (_) async{
       await fetchNews(); // Re-fetch news periodically
    });
  }
  void stopFetchingData()async{
    if(_timer!=null){
      _timer!.cancel();
      _timer=null;
      Print.p("stopped===>Seelf neew data fetching");
    }
  }

  @override
  void onClose() {
    _timer?.cancel(); // Cancel the timer when the controller is closed
    super.onClose();
  }
}
