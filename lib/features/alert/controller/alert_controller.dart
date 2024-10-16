import 'package:get/get.dart';

class AlertIndexChange{
  var con=Get.find<AlertCon>();
  void onIndexChange(index){
    con.setIndex(index);
  }
}

class AlertCon extends GetxController {
  RxInt index = 0.obs;
  void setIndex(int newIndex) {
    index.value = newIndex;
  }
}