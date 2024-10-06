import 'package:flutter/material.dart';

class VerifyNumberController{
  String title;
  String subTitle;
  Widget nextPage;
  var phno=TextEditingController();
  var countryCode=TextEditingController(text: "+91");
  VerifyNumberController({required this.title,required this.nextPage,required this.subTitle});

  void onVerifyNumber(){

  }
}