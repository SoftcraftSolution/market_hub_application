import 'dart:async';

import 'package:get/get.dart';
import 'package:market_hub_application/features/future/pages/LME_Page/pages/Warehouse_Stock/api/warehouse_api_service.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../user/naviagtion/controller/navigation_controller.dart';
import '../../../../../controller/futureController.dart';
import '../../../controller/lmePageController.dart';
import '../model/warehouse_model.dart';

class WarehouseCon extends GetxController {
  var warehouseData = <LmeStock>[].obs;

  var _timer;
  var homeCon=Get.find<HomeCon>();
  var futureCon=Get.find<FutureController>();
  var lmeCon=Get.find<LMEPageCon>();
  WarehouseCon();

  @override
  void onInit() {
    fetchLmeData();
    everAll([homeCon.pageIndex,futureCon.pageIndex,lmeCon.pageIndex],
            (_)async{
          if(homeCon.pageIndex.value==1 && futureCon.pageIndex.value==0 && lmeCon.pageIndex.value==1){
            await startFetchingData();
          }else{
            stopFetchingData();
          }
        });
    super.onInit();
  }

  Future<void> startFetchingData() async{
    Print.p("Stared fetching Warehouse data");
    _timer?.cancel();
    fetchLmeData();
    // Fetch data immediately on start
    // Schedule to fetch data every 10 seconds
    _timer = Timer.periodic(Duration(seconds: 10), (_) async{
   fetchLmeData();
    });
  }
  void stopFetchingData()async{
    if(_timer!=null){
      _timer!.cancel();
      _timer=null;
      Print.p("stopped===>Warehouse data fetching");
    }
  }
  void fetchLmeData() async {
    try {

      LmeWarehouseData data = await WarehouseApiService().fetchLmeWarehouseData();
      warehouseData.assignAll(data.lmeStocks);
      Print.p(warehouseData.value.length.toString());
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
}
