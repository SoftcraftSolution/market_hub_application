import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/core/theme/theme.dart';
import 'package:market_hub_application/features/plans/ui/plans_page.dart';


import 'features/user/registration/ui/registration.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key}){
     Future.delayed(Duration(seconds: 2),()async{
       Get.off(Registration());
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      body: Center(child: Image.asset("assets/splash_screeen_img/logo.png",height: 260,),),
    );
  }
}
