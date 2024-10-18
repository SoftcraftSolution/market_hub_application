import 'dart:async';

import 'package:get/get.dart';

import '../api/lme_futur_api_service.dart';

class LMEFuturePageCon extends GetxController{
  RxInt pageIndex=0.obs;
  RxList<dynamic> lme_data = <dynamic>[].obs; // Observable list
  late Timer _timer;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    startFetchingData();
  }

  void seIndex(int newIndex) {
    pageIndex.value = newIndex;
  }

  void startFetchingData() async{
    lme_data.value=await LMEFutureApiService().fetchLMEData(); // Fetch data immediately on start
    // Schedule to fetch data every 10 seconds
    // _timer = Timer.periodic(Duration(seconds: 3), (_) async{
    //   lme_data.value=await LMEAPiService().fetchLMEData();
    // });
  }



  @override
  void onClose() {
    _timer.cancel(); // Stop the timer when the controller is closed
    super.onClose();
  }
}

class LMEFuturePageIndexChange{
  var con=Get.find<LMEFuturePageCon>();
  void onIndexChange(int index){
    con.seIndex(index);
  }
}