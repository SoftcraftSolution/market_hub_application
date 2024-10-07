import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/core/constants/text_style_constant.dart';
import 'package:market_hub_application/core/theme/theme.dart';
import 'package:market_hub_application/features/user/login/ui/login_screen.dart';



class AdminApprovalScreen extends StatelessWidget {
   AdminApprovalScreen({super.key}){
    Future.delayed(Duration(seconds: 1), () {
      Get.to(LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: ColorConstants.backgroundColor,body: Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(

        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset("assets/splash_screeen_img/waiting.png",height: 200,width: 200,),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Your profile is under review",
                    style: TextStyleConstant.headerTextStyle,
                  ),
                ),
                Text(
                  "To ensure our community maintains its quality, we don't accept all profiles.",
                  textAlign: TextAlign.center,
                  style: TextStyleConstant.subHeaderTextStyle,)
              ],
            ),
          ),
          SizedBox(height: 100,)
        ],
      ),
    ),);
  }
}
