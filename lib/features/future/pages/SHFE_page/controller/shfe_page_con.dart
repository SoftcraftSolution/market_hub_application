import 'dart:async';

import 'package:get/get.dart';
import 'package:market_hub_application/features/future/pages/SHFE_page/api/shfe_api_services.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../user/naviagtion/controller/navigation_controller.dart';
import '../../../controller/futureController.dart';

class SHFE_Page_Con extends GetxController
{

  RxList<dynamic> data = <dynamic>[].obs; // Observable list
  var _timer;

  var homeCon=Get.find<HomeCon>();
  var futureCon=Get.find<FutureController>();


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    everAll([homeCon.pageIndex,futureCon.pageIndex],
            (_)async{
          if(homeCon.pageIndex.value==1 && futureCon.pageIndex.value==2 ){
            await startFetchingData();
          }else{
            stopFetchingData();
          }
        });
    startFetchingData();
  }

  Future<void> startFetchingData() async{
    Print.p("Stared fetching SHFE data");
    _timer?.cancel();
    data.value=await SHFEPageApiService().fetchShfeData();
    // Fetch data immediately on start
    // Schedule to fetch data every 10 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (_) async{
      data.value=await SHFEPageApiService().fetchShfeData();
    });
  }


  void stopFetchingData()async{
    if(_timer!=null){
      _timer!.cancel();
      _timer=null;
      Print.p("stopped===>SHFE data fetching");
    }
  }

  @override
  void onClose() {
    _timer.cancel(); // Stop the timer when the controller is closed
    super.onClose();
  }
}





