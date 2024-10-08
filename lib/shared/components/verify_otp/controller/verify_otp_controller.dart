import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/utils.dart';

class VerifyOTPController{
  String otp;
  TextEditingController enteredOtp=TextEditingController();
  Widget nextPage;
  VerifyOTPController({required this.otp,required this.nextPage});

  Future<void> onVerify() async{

    if(otp==enteredOtp.text){
      Get.to(nextPage);
    }else{
      customToast(msg: "Wrong pin",isErrorMsg: true);
    }

  }
}