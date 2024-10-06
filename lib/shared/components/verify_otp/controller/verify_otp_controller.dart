import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/utils.dart';

class VerifyOTPController{
  String otp;
  String enteredOtp;
  Widget nextPage;
  VerifyOTPController({required this.enteredOtp,required this.otp,required this.nextPage});

  void onVerify() {
    if(otp==enteredOtp){
      Get.to(nextPage);
    }else{
      customToast(msg: "Wrong pin",isErrorMsg: true);
    }

  }
}