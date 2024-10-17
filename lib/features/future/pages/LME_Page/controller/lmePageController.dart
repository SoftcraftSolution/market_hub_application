import 'dart:async';

import 'package:get/get.dart';
import 'package:market_hub_application/features/future/pages/LME_Page/api/lme_api_service.dart';

import '../../../../../core/api/api_services.dart';

class LMEPageCon extends GetxController{
  RxInt index=0.obs;
  RxList<dynamic> lme_data = <dynamic>[].obs; // Observable list
  late Timer _timer;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    startFetchingData();
  }

  void seIndex(int newIndex) {
    index.value = newIndex;
  }

  void startFetchingData() async{
    lme_data.value=await LMEAPiService().fetchLMEData(); // Fetch data immediately on start
    // Schedule to fetch data every 10 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (_) async{
      lme_data.value=await LMEAPiService().fetchLMEData();
    });
  }



  @override
  void onClose() {
    _timer.cancel(); // Stop the timer when the controller is closed
    super.onClose();
  }
}

class indexChange{
  var con=Get.find<LMEPageCon>();
  void onIndexChange(int index){
    con.seIndex(index);
  }
}