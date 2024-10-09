import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/core/theme/theme.dart';
import 'package:market_hub_application/features/home/ui/home_page.dart';
import 'package:market_hub_application/features/plans/ui/plans_page.dart';
import 'package:market_hub_application/features/user/naviagtion/controller/navigation_controller.dart';
import 'package:market_hub_application/features/user/registration/ui/admin_approval_screen.dart';
import 'package:market_hub_application/main.dart';


import 'features/user/registration/ui/registration.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key}){
     Future.delayed(Duration(seconds: 2),()async{
       isInProcess?isApproved?Get.off(HomePage()):Get.off(AdminApprovalScreen()):Get.off(Registration());
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
