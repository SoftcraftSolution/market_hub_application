import 'package:flutter/material.dart';

class VerifyEmailController{
  String title;
  String subTitle;
  Widget nextPage;
  var phno=TextEditingController();
  var countryCode=TextEditingController(text: "+91");
  VerifyEmailController({required this.title,required this.nextPage,required this.subTitle});

  void onVerifyNumber(){

  }
}