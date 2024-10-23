// lib/controllers/home_update_controller.dart
import 'dart:async';

import 'package:get/get.dart';
import 'package:market_hub_application/features/home/api/home_api_services.dart';
import 'package:market_hub_application/features/user/naviagtion/controller/navigation_controller.dart';

import '../../../core/utils/utils.dart';
import '../model/home_updates_model.dart';


class HomeUpdateController extends GetxController {


  var homeUpdates = <HomeUpdate>[].obs;
  var isLoading = true.obs;
  var _timer;
  var homeCon=Get.find<HomeCon>();

  @override
  void onInit() {
    super.onInit();
    fetchHomeUpdates();
    startFetchingData();
    ever(homeCon.pageIndex,
            (_)async{
          if(homeCon.pageIndex.value==0){
            await startFetchingData();
          }else{
            stopFetchingData();
          }
        });// Initial fetch
    // periodicUpdate();
  }
  Future<void> startFetchingData() async{
    Print.p("Stared fetching home updates data");
    _timer?.cancel();
    // lme_data.value=await LMEFutureApiService().fetchLMEData(); // Fetch data immediately on start
    // Schedule to fetch data every 10 seconds
    _timer = Timer.periodic(Duration(seconds: 15), (_) async{
      await fetchHomeUpdates();
    });
  }

  Future<void> fetchHomeUpdates() async {
    try {
      isLoading(true);
      var updates = await HomeApiService().fetchHomeUpdates();
      homeUpdates.assignAll(updates.reversed.toList()); // Most recent on top
    } finally {
      isLoading(false);
    }
  }
  void stopFetchingData()async{
    if(_timer!=null){
      _timer!.cancel();
      _timer=null;
      Print.p("stopped===> Home updates data fetching");
    }
  }


}
