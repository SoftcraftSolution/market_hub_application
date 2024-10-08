import 'package:get/get.dart';

class CardIndexTrackerController extends GetxController{
  RxInt activeIndex=1.obs;

  void editActiveIndexes({required int newIndex}){
    activeIndex.value=newIndex;
  }
}