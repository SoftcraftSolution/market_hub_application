import 'dart:async';
import 'package:get/get.dart';
import 'package:market_hub_application/features/future/pages/MCX_Page/api/mcx_page_api_services.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../user/naviagtion/controller/navigation_controller.dart';
import '../../../controller/futureController.dart';

class MCXPageCon extends GetxController {
  RxList<dynamic> data = <dynamic>[].obs; // Original data
  RxList<dynamic> usData = <dynamic>[].obs; // Filtered data

  var _timer;
  var homeCon = Get.find<HomeCon>();
  var futureCon = Get.find<FutureController>();

  @override
  void onInit() {
    super.onInit();
    startFetchingData();
    everAll([homeCon.pageIndex, futureCon.pageIndex], (_) async {
      if ((homeCon.pageIndex.value == 1 && futureCon.pageIndex.value == 1) || futureCon.pageIndex.value==3) {
        await startFetchingData();
      } else {
        stopFetchingData();
      }
    });
  }

  Future<void> startFetchingData() async {
    Print.p("Started fetching MCX data");
    _timer?.cancel();

    // Fetch data immediately
    var fetchedData = await MCXPageApiServices().fetchMCXData();
    data.value = fetchedData;
    updateUSData(); // Update USData initially

    // Schedule periodic updates every 3 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (_) async {
      fetchedData = await MCXPageApiServices().fetchMCXData();
      data.value = fetchedData;
      updateUSData(); // Keep USData in sync
    });
  }

  void updateUSData() {
    // Predefined list of symbols to filter
    var filter = ["GOLD", "SILVER", "COPPER", "CRUDE OIL", "BRENT OIL", "NATURAL GAS"];

    // Apply filter on the Symbol field
    usData.value = data.where((item) {
      // Check if the symbol exists in the filter list
      return filter.contains(item['Symbol'].toString());
    }).toList();
  }


  void stopFetchingData() async {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
      Print.p("Stopped fetching MCX data");
    }
  }

  @override
  void onClose() {
    _timer.cancel(); // Stop the timer when the controller is closed
    super.onClose();
  }
}
