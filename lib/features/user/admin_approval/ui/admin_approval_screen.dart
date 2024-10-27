import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/core/constants/text_style_constant.dart';
import 'package:market_hub_application/core/theme/theme.dart';
import 'package:market_hub_application/features/user/admin_approval/controller/admin_approval_controller.dart';
import 'package:market_hub_application/features/user/login/ui/login_screen.dart';
import 'package:market_hub_application/shared/components/verify_email/ui/verify_email.dart';
import 'package:market_hub_application/shared/components/verify_otp/ui/verify_otp.dart';
import 'package:market_hub_application/shared/widget/button/custom_button.dart';



class AdminApprovalScreen extends StatelessWidget {
   AdminApprovalScreen({super.key}){
     AdminApprovalController().checkApproval();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: ColorConstants.backgroundColor,body: Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: [
          Expanded(
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
                        child: Text(textAlign: TextAlign.center,
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
          ),
          // CustomButton(title: "Login with another Email", onPress: onLoginWithAnother,isLessPrioterise: true,)
        ],
      ),
    ),);
  }

  // Future<void> onLoginWithAnother()async{
  //   Get.offAll(VerifyEmail(title: "Verification", subTitle: "Enter your Email for Verification."));
  // }
}
