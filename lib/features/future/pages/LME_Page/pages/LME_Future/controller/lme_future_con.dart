import 'dart:async';

import 'package:get/get.dart';

import '../../../../../../../core/utils/utils.dart';
import '../../../../../../user/naviagtion/controller/navigation_controller.dart';
import '../../../../../controller/futureController.dart';
import '../../../controller/lmePageController.dart';
import '../api/lme_futur_api_service.dart';

class LMEFuturePageCon extends GetxController{

  RxList<dynamic> lme_data = <dynamic>[].obs; // Observable list
  var _timer;
  var homeCon=Get.find<HomeCon>();
  var futureCon=Get.find<FutureController>();
  var lmeCon=Get.find<LMEPageCon>();

  @override
  void onInit() {
    super.onInit();
    // TODO: implement onInit
    startFetchingData();
    everAll([homeCon.pageIndex,futureCon.pageIndex,lmeCon.pageIndex],
            (_)async{
      if(homeCon.pageIndex.value==1 && futureCon.pageIndex.value==0 && lmeCon.pageIndex.value==0){
        await startFetchingData();
      }else{
        stopFetchingData();
      }
    });


  }



  Future<void> startFetchingData() async{
    Print.p("Stared fetching LME future data");
    _timer?.cancel();
    // lme_data.value=await LMEFutureApiService().fetchLMEData(); // Fetch data immediately on start
    // Schedule to fetch data every 10 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (_) async{
      lme_data.value=await LMEFutureApiService().fetchLMEFutureData();
    });
  }
  void stopFetchingData()async{
    if(_timer!=null){
      _timer!.cancel();
      _timer=null;
      Print.p("stopped===>lme future data fetching");
    }
  }



  @override
  void onClose() {
    _timer.cancel(); // Stop the timer when the controller is closed
    super.onClose();
  }
}

