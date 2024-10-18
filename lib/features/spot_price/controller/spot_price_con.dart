import 'package:get/get.dart';

class SpotPriceCon extends GetxController {
  RxInt pageIndex = 0.obs;
  void setPageIndex(int newValue) {
    pageIndex.value = newValue;
  }
}

class SpotOptionIndexChange{
  var con=Get.find<SpotPriceCon>();
  void onIndexChange(int index){
    con.setPageIndex(index);
  }
}