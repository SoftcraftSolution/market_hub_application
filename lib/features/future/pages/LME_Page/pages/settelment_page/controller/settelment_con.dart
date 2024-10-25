// controllers/settlement_controller.dart

import 'dart:async';

import 'package:get/get.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../user/naviagtion/controller/navigation_controller.dart';
import '../../../../../controller/futureController.dart';
import '../../../controller/lmePageController.dart';
import '../api/settelment_api_service.dart';
import '../model/settelment_model.dart';

class SettlementController extends GetxController {

  var settlements = <Settlement>[].obs;
  var _timer;
  var homeCon=Get.find<HomeCon>();
  var futureCon=Get.find<FutureController>();
  var lmeCon=Get.find<LMEPageCon>();

  @override
  void onInit() {
    fetchSettlements();
    everAll([homeCon.pageIndex,futureCon.pageIndex,lmeCon.pageIndex],
            (_)async{
          if(homeCon.pageIndex.value==1 && futureCon.pageIndex.value==0 && lmeCon.pageIndex.value==2){
            await startFetchingData();
          }else{
            stopFetchingData();
          }
        });
    super.onInit();
  }
  void stopFetchingData()async{
    if(_timer!=null){
      _timer!.cancel();
      _timer=null;
      Print.p("stopped===>sttlement  data fetching");
    }
  }

  Future<void> startFetchingData() async{
    Print.p("Stared fetching sttlement data");
    _timer?.cancel();
    fetchSettlements();
    // Fetch data immediately on start
    // Schedule to fetch data every 10 seconds
    _timer = Timer.periodic(Duration(seconds: 10), (_) async{
      fetchSettlements();
    });
  }

  Future<void> fetchSettlements() async {
    try {

      var result = await SettlementService().fetchSettlements();
      settlements.assignAll(result);
    } catch(e){
      Print.p(e.toString());
    }
  }
}
