import 'package:get/get.dart';

class SpotPriceCon extends GetxController {
  RxInt index = 0.obs;
  void setPageIndex(int newValue) {
    index.value = newValue;
  }
}

class SpotOptionIndexChange{
  var con=Get.find<SpotPriceCon>();
  void onIndexChange(int index){
    con.setPageIndex(index);
  }
}