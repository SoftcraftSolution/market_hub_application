import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/core/theme/theme.dart';
import 'package:market_hub_application/core/utils/wrap_over_hive.dart';
import 'package:market_hub_application/features/home/ui/home_page.dart';
import 'package:market_hub_application/features/plans/ui/plans_page.dart';
import 'package:market_hub_application/features/user/login/ui/login_screen.dart';
import 'package:market_hub_application/features/user/naviagtion/controller/navigation_controller.dart';
import 'package:market_hub_application/features/user/admin_approval/ui/admin_approval_screen.dart';
import 'package:market_hub_application/main.dart';

import 'core/utils/userDataCon.dart';
import 'core/utils/utils.dart';
import 'features/user/naviagtion/ui/navigation.dart';
import 'features/user/registration/ui/registration.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key}){

  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5),directUser);
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      body: Center(child: Image.asset("assets/splash_screeen_img/logoAnimated.gif",height: 260,),),
    );
  }

  void directUser()async{
    bool isApproved=false;
    bool isInProcess=false;
    UserDataController.userDetail=await WrapOverHive.getUserData();
    if (UserDataController.userDetail!=null){
      isInProcess=true;
      isApproved=UserDataController.userDetail!.isApproved!;
    }
    isInProcess?isApproved?Get.off(LoginScreen()):Get.off(AdminApprovalScreen()):Get.off(Registration());
  }
  // test only
  void navigateTo(){
     Print.p("in navigateTo method");
     Get.off(AdminApprovalScreen());
  }
}
