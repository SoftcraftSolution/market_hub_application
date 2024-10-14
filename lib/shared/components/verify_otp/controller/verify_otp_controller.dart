import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/utils.dart';

class VerifyOTPController{
  String otp;
  TextEditingController enteredOtp=TextEditingController();
  Widget nextPage;
  VoidCallback  afterVerify;
  VerifyOTPController({required this.otp,required this.nextPage,required this.afterVerify});

  Future<void> onVerify() async{

    if(otp==enteredOtp.text){
      afterVerify();
      Get.off(nextPage);
    }else{
      customToast(msg: "Wrong pin",isErrorMsg: true);
    }

  }
}