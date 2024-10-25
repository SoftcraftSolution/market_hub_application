import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:market_hub_application/core/utils/utils.dart';
import 'package:market_hub_application/features/user/admin_approval/ui/admin_approval_screen.dart';
import 'package:market_hub_application/features/user/login/ui/login_screen.dart';
import 'package:market_hub_application/shared/components/success_page.dart';
import 'package:market_hub_application/shared/components/update_pin/ui/set_pin.dart';
import 'package:market_hub_application/shared/components/verify_email/api/api_service.dart';
import 'package:market_hub_application/shared/components/verify_otp/ui/verify_otp.dart';
import 'package:market_hub_application/splash_screen.dart';

import '../../../../core/models/userdetail.dart';
import '../../../../core/utils/wrap_over_hive.dart';
import '../../../../features/home/ui/home_page.dart';

class VerifyEmailController {
  String title;
  String subTitle;
  var emailCon = TextEditingController();

  VerifyEmailController({required this.title, required this.subTitle});

  Future<void> onVerifyEmail() async {
    if (emailCon.text.isEmail) {
      var response = await VerifyEmailApiService()
          .verifyEmailApiService(email: emailCon.text, verifyUser: true);

      if (response != null) {
        if (response["isAlreadyRegistered"] == true) {
          bool approverd = response["user"]["isApproved"];
          Get.off(() => VerifyOtp(
            // becuse this is for the do  something wheen login prrocess like storing data after otp verification
            afterVerify: title == "Verification"?()async{
              // Print.p("in after verify method");
              UserDetail userData=UserDetail.fromMap(response["user"]);
              await WrapOverHive.locallizeUserData(userData);
            }:(){},
              otp: response["user"]["otp"].toString(),
              nextPage: title == "Verification"
                  ? (approverd ? SplashScreen() : AdminApprovalScreen())
                  : EnterPinScreen(
                email: emailCon.text,
                      nextPage: SuccessPage(
                        title: "Successful",
                        subTitle:
                            "PIN reset complete! Your new PIN is ready to be used.",
                        nextPage: LoginScreen(),
                      ),
                      isResetEnterPinPage: true)));
        } else {
          customToast(msg: "Not registered Email");
        }
      }
    } else {
      customToast(msg: "Invailid Email");
    }
  }


}
