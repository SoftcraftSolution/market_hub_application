import 'dart:async';
import 'package:get/get.dart';
import '../../../../../core/utils/utils.dart';
import '../api/fx_api_service.dart';
import '../model/fx_model.dart';
import '../../../../user/naviagtion/controller/navigation_controller.dart';
import '../../../controller/futureController.dart';

class FXPageCon extends GetxController {
  RxList<FXModel> fxData = <FXModel>[].obs; // Observable list
  Timer? _timer;
  var homeCon = Get.find<HomeCon>();
  var futureCon = Get.find<FutureController>();

  // List of desired symbols in the desired order
  final List<String> desiredSymbols = [
    "USD/INR",
    "DOLLAR INDEX",
    "EUR/USD",
    "GBP/USD",
    "USD/JPY",
    "USD/CNY",
    "USD/MYR",
    "USD/SGD",
    "USD/RUB",
    "USD/ZAR",
    "USD/HKD",
  ];

  @override
  void onInit() {
    super.onInit();
    startFetchingData();

    everAll([homeCon.pageIndex, futureCon.pageIndex], (_) async {
      if (homeCon.pageIndex.value == 1 && futureCon.pageIndex.value == 4) {
        await startFetchingData();
      } else {
        stopFetchingData();
      }
    });
  }

  Future<void> startFetchingData() async {
    Print.p("Started fetching FX data");
    _timer?.cancel();

    var fetchedData = await FXApiServices().fetchFXData();
    fxData.value = _filterAndSortData(fetchedData);  // Filter and sort

    _timer = Timer.periodic(Duration(seconds: 10), (_) async {
      var newData = await FXApiServices().fetchFXData();
      fxData.value = _filterAndSortData(newData);  // Filter and sort
    });
  }

  void stopFetchingData() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
      Print.p("Stopped FX data fetching");
    }
  }

  @override
  void onClose() {
    stopFetchingData();
    super.onClose();
  }

  // Filter and sort the fetched data based on the desired symbols
  List<FXModel> _filterAndSortData(List<FXModel> data) {
    return data
        .where((item) => desiredSymbols.contains(item.symbol))  // Filter
        .toList()
      ..sort((a, b) => desiredSymbols
          .indexOf(a.symbol)
          .compareTo(desiredSymbols.indexOf(b.symbol)));  // Sort
  }
}
