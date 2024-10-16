// lib/api_controller.dart

import 'dart:async';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/core/api/api_services.dart';

class FutureController extends GetxController {
  RxInt pageIndex=0.obs;

  FutureController();
  void setIndex(int newIndex) {
    pageIndex.value = newIndex;
  }



}

class FutureIndexChange{
  var con=Get.find<FutureController>();
  void onIndexChange(int index){
    con.setIndex(index);
  }
}


