import 'dart:async';

import 'package:get/get.dart';
import 'package:market_hub_application/features/future/pages/LME_Page/pages/LME_Future/api/lme_futur_api_service.dart';

import '../../../../../core/api/api_services.dart';

class LMEPageCon extends GetxController{
  RxInt pageIndex=0.obs;

  void seIndex(int newIndex) {
    pageIndex.value = newIndex;
  }

}

class LMEPageIndexChange{
  var con=Get.find<LMEPageCon>();
  void onIndexChange(int index){
    con.seIndex(index);
  }
}