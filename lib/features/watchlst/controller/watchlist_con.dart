import 'package:get/get.dart';

class WatchlistCon extends GetxController{
  RxInt pageIndex=0.obs;
  void seIndex(int newIndex) {
    pageIndex.value = newIndex;
  }
}



class WatchlistPageIndexChange{
  var con=Get.find<WatchlistCon>();
  void onIndexChange(int index){
    con.seIndex(index);
  }
}