import 'dart:async';

import 'package:get/get.dart';
import 'package:market_hub_application/features/future/pages/FX_page/api/fx_api_service.dart';

import '../../../../../../../core/utils/utils.dart';
import '../../../../user/naviagtion/controller/navigation_controller.dart';
import '../../../controller/futureController.dart';

class FXPageCon extends GetxController{

  RxList<dynamic> fx_data = <dynamic>[].obs; // Observable list
  var _timer;
  var homeCon=Get.find<HomeCon>();
  var futureCon=Get.find<FutureController>();


  @override
  void onInit() {
    super.onInit();
    // TODO: implement onInit
    startFetchingData();
    everAll([homeCon.pageIndex,futureCon.pageIndex],
            (_)async{
          if(homeCon.pageIndex.value==1 && futureCon.pageIndex.value==4){
            await startFetchingData();
          }else{
            stopFetchingData();
          }
        });


  }



  Future<void> startFetchingData() async{
    Print.p("Stared fetching FX data");
    _timer?.cancel();
    fx_data.value=await FXApiServices().fetchFXData();
    // lme_data.value=await LMEFutureApiService().fetchLMEData(); // Fetch data immediately on start
    // Schedule to fetch data every 10 seconds
    _timer = Timer.periodic(Duration(seconds: 8), (_) async{
      fx_data.value=await FXApiServices().fetchFXData();
    });
  }
  void stopFetchingData()async{
    if(_timer!=null){
      _timer!.cancel();
      _timer=null;
      Print.p("stopped===>FX data fetching");
    }
  }



  @override
  void onClose() {
    _timer.cancel(); // Stop the timer when the controller is closed
    super.onClose();
  }
}

