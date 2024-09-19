import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/screens/registeration_screen/registration.dart';
import 'package:market_hub_application/utility/theme.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key}){
     Future.delayed(Duration(seconds: 2),()async{
       Get.off(Registration());
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Center(child: Image.asset("assets/splash_screeen_img/logo.png",height: 260,),),
    );
  }
}
