import 'package:get/get.dart';

class CardIndexTrackerController extends GetxController{
  RxInt activeIndex=0.obs;

  void editActiveIndexes({required int newIndex}){
    activeIndex.value=newIndex;
  }
}