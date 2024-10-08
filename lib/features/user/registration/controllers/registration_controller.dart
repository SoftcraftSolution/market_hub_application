import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/core/models/user_deatail_model.dart';
import 'package:market_hub_application/features/user/registration/api/registration_api_service.dart';
import 'package:market_hub_application/features/user/registration/ui/admin_approval_screen.dart';
import 'package:market_hub_application/shared/components/success_page.dart';
import 'package:market_hub_application/shared/components/update_pin/ui/set_pin.dart';
import 'package:market_hub_application/shared/components/verify_email/api/api_service.dart';
import 'package:market_hub_application/shared/components/verify_email/ui/verify_email.dart';

import '../../../../core/api/api_services.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/utils/wrap_over_hive.dart';
import '../../../../shared/components/verify_otp/ui/verify_otp.dart';

class RegistrationCon extends GetxController {
  RxBool isUploaded = false.obs;
  RxBool isAcceptedTerms = false.obs;
  RxString finalName = "".obs;

  UserDetail? user;
  ////
  TextEditingController nameCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  TextEditingController pincodeCon = TextEditingController();
  TextEditingController imgCon = TextEditingController();
  // phoone number
  TextEditingController phnoCon = TextEditingController();
  TextEditingController countryCodeCon = TextEditingController(text: "+91");
  // whatsapp
  TextEditingController whatsappPhnoCon = TextEditingController();
  TextEditingController whatsappCountryCodeCon =
      TextEditingController(text: "+91");

  void setUploadState(var newValue) {
    if (newValue != isUploaded.value) {
      isUploaded.value = newValue;
    }
  }

  void setFileName(String finalName) {
    this.finalName.value = finalName;
  }

  void setTerms(bool newValue) {
    this.isAcceptedTerms.value = newValue;
  }

  Future<void> onRegister() async {
    Print.p("in onRegister");
    var fullName = this.nameCon.text;
    var countryCode = this.countryCodeCon.text;
    var phno = this.phnoCon.text;
    var whatsappCountryCode = this.whatsappCountryCodeCon.text;
    var whatsappPhone = this.whatsappPhnoCon.text;
    var pincode = this.pincodeCon.text;
    var email = this.emailCon.text;
    var visitingCard = this.imgCon.text;
    try {
      if (fullName != "") {
        if (((countryCode.length >= 1) && (countryCode.contains("+"))) &&
            ((whatsappCountryCode.length >= 1) &&
                (whatsappCountryCode.contains("+")))) {
          if (phno.length == 10 && whatsappPhone.length == 10) {
            if (email.isEmail) {
              if (pincode.length >= 4 && pincode.length <= 8) {
                if (visitingCard != "") {
                  if (isAcceptedTerms.value) {
                    // Print.p("all done:$visityCard");
                    user = UserDetail(
                        phoneNumber: "$countryCode$phno",
                        pincode: pincode,
                        visitingCard: File(visitingCard),
                        email: email,
                        name: fullName,
                        whatsappNumber: "$whatsappCountryCode$whatsappPhone");
                    var response = await VerifyEmailApiService()
                        .verifyEmailApiService(email: email, verifyUser: false);
                    Print.p(response.toString());
                    response == null
                        ? ""
                        : Get.to(VerifyOtp(
                            otp: response["otp"].toString(),
                            nextPage: EnterPinScreen(
                                nextPage: SuccessPage(
                                  title: "Successful",
                                  subTitle:
                                      "Your PIN has been successfully set up and is now ready to use",
                                  nextPage: AdminApprovalScreen(),
                                ),
                                isResetEnterPinPage: false)));
                  } else {
                    customToast(msg: "Accept Term and Conditions");
                  }
                } else {
                  customToast(msg: "Upload Your Visiting Card");
                }
              } else {
                customToast(msg: "Invaild PinCode");
              }
            } else {
              customToast(msg: "Invaild email");
            }
          } else {
            customToast(msg: "Invailid Phone numbers");
          }
        } else {
          customToast(msg: "Invailid Country Code");
        }
      } else {
        customToast(msg: "full name required");
      }
    } catch (e) {
      customToast(msg: "Something went wrong...");
    }
  }
}
