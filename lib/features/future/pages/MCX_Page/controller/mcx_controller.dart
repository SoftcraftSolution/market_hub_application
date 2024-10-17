import 'dart:async';

import 'package:get/get.dart';

import '../../../../../core/api/api_services.dart';

class MCXPageCon extends GetxController{
  RxInt index=0.obs;
  RxList<dynamic> data = <dynamic>[].obs; // Observable list
  late Timer _timer;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    startFetchingData();
  }

  void seIndex(int newIndex) {
    index.value = newIndex;
  }

  void startFetchingData() async{
    await fetchMCXData(); // Fetch data immediately on start
    // Schedule to fetch data every 10 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (_) {
      fetchMCXData();
    });
  }

  Future<void> fetchMCXData() async {
    try {
      final response = await BaseApiServices.dio.get('https://mcx-scrap.vercel.app/api/mcx');
      if (response.statusCode == 200) {
        data.value = response.data; // Update the observable list
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void onClose() {
    _timer.cancel(); // Stop the timer when the controller is closed
    super.onClose();
  }
}

class indexChange{
  var con=Get.find<MCXPageCon>();
  void onIndexChange(int index){
    con.seIndex(index);
  }
}