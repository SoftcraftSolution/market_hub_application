import 'package:get/get.dart';
import 'package:market_hub_application/features/future/pages/refrence_rate_page/api/ref_rate_api_service.dart';
import 'package:market_hub_application/features/future/pages/refrence_rate_page/model/exchange_rate_model.dart';

import '../../../controller/futureController.dart';

class RefRatePageCon extends GetxController{
  RxInt pageIndex=0.obs;
  RxList sbi_tt_data=[].obs;
  RxList rbi_tt_data=[].obs;
  var futureCon=Get.find<FutureController>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchRefRateData();
    ever(futureCon.pageIndex, (_){
      if(futureCon.pageIndex.value==5){
        fetchRefRateData();
      }
    });

  }

  void seIndex(int newIndex) {
    pageIndex.value = newIndex;
  }
  void fetchRefRateData()async{
    var data=await RefRateApiService().fetchRefRateData();
    sbi_tt_data.value=data["sbi_tt"]!;
    rbi_tt_data.value=data["rbi_tt"]!;
  }

}

class RefRatePageIndexChange{
  var con=Get.find<RefRatePageCon>();
  void onIndexChange(int index){
    con.seIndex(index);
  }
}