import 'dart:async';
import 'package:get/get.dart';
import 'package:market_hub_application/features/future/pages/MCX_Page/api/mcx_page_api_services.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../user/naviagtion/controller/navigation_controller.dart';
import '../../../controller/futureController.dart';

class MCXPageCon extends GetxController {
  RxList<dynamic> data = <dynamic>[].obs; // Original data
  RxList<dynamic> mcxdata = <dynamic>[].obs; // Filtered MCX data
  RxList<dynamic> usData = <dynamic>[].obs; // Filtered US data

  Timer? _timer;
  var homeCon = Get.find<HomeCon>();
  var futureCon = Get.find<FutureController>();

  @override
  void onInit() {
    super.onInit();
    startFetchingData(); // Start fetching on initialization

    // Monitor page index changes to control data fetching
    everAll([homeCon.pageIndex, futureCon.pageIndex], (_) async {
      if ((homeCon.pageIndex.value == 1 && futureCon.pageIndex.value == 1) || futureCon.pageIndex.value == 3) {
        await startFetchingData();
      } else {
        stopFetchingData();
      }
    });
  }

  Future<void> startFetchingData() async {
    Print.p("Started fetching MCX data");
    _timer?.cancel(); // Cancel any existing timer

    // Fetch data immediately and update both lists
    var fetchedData = await MCXPageApiServices().fetchMCXData();
    data.value = fetchedData;
    updateUSData();
    updateMCXData();

    // Schedule periodic updates every 3 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (_) async {
      fetchedData = await MCXPageApiServices().fetchMCXData();
      data.value = fetchedData;
      updateUSData();
      updateMCXData();
    });
  }

  // Update USData by filtering specific symbols
  void updateUSData() {
    var filter = ["GOLD", "SILVER", "COPPER", "CRUDE OIL", "BRENT OIL", "NATURAL GAS"];
    usData.value = data.where((item) {
      return filter.contains(item['Symbol'].toString());
    }).toList();
  }

  // Update MCXData by excluding specific symbols
  void updateMCXData() {
    var exclude = ["GOLD", "SILVER", "COPPER", "CRUDE OIL", "BRENT OIL", "NATURAL GAS"];
    mcxdata.value = data.where((item) {
      return !exclude.contains(item['Symbol'].toString());
    }).toList();
  }

  // Stop fetching data when not needed
  void stopFetchingData() async {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
      Print.p("Stopped fetching MCX data");
    }
  }

  @override
  void onClose() {
    _timer?.cancel(); // Ensure timer is stopped when controller closes
    super.onClose();
  }
}
