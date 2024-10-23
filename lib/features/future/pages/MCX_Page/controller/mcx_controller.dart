import 'dart:async';

import 'package:get/get.dart';
import 'package:market_hub_application/features/future/pages/MCX_Page/api/mcx_page_api_services.dart';

import '../../../../../core/api/api_services.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../user/naviagtion/controller/navigation_controller.dart';
import '../../../controller/futureController.dart';

class MCXPageCon extends GetxController{

  RxList<dynamic> data = <dynamic>[].obs; // Observable list
var _timer;

  var homeCon=Get.find<HomeCon>();
  var futureCon=Get.find<FutureController>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    startFetchingData();
    everAll([homeCon.pageIndex,futureCon.pageIndex],
            (_)async{
          if(homeCon.pageIndex.value==1 && futureCon.pageIndex.value==1 ){
            await startFetchingData();
          }else{
            stopFetchingData();
          }
        });

  }



  Future<void> startFetchingData() async{
    Print.p("Stared fetching MCX data");
    _timer?.cancel();
    data.value=await MCXPageApiServices().fetchMCXData();
     // Fetch data immediately on start
    // Schedule to fetch data every 10 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (_) async{
      data.value=await MCXPageApiServices().fetchMCXData();
    });
  }
  void stopFetchingData()async{
    if(_timer!=null){
      _timer!.cancel();
      _timer=null;
      Print.p("stopped===>MCX data fetching");
    }
  }



  @override
  void onClose() {
    _timer.cancel(); // Stop the timer when the controller is closed
    super.onClose();
  }
}


