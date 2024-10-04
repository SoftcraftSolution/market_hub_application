import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/shared/components/success_page.dart';
import 'package:market_hub_application/core/api/api_services.dart';
import 'package:market_hub_application/core/theme/theme.dart';
import 'package:market_hub_application/core/utils/wrap_over_hive.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

import '../../../widget/button.dart';
import '../../../../core/utils/utiliity.dart';
import '../../../../features/user/registration/ui/admin_approval_screen.dart';

class EnterPinScreen extends StatelessWidget {
  bool isResetPinPage;
  String fotp="";
  String sotp="";
   EnterPinScreen({super.key,this.isResetPinPage=false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: ColorConstants.backgroundColor,
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      leading: BackButton(),
    ),
    body:  Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                            isResetPinPage?"Reset PIN":"Enter PIN",
                          style: GoogleFonts.poppins(
                              fontSize: 26, fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(
                          "To set up your PIN (Enter 4 digit code and confirm it below)",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 18, color: Color(0xff646464)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 80),
                        child: OtpPinField(
                          fieldHeight: 60,
                          fieldWidth: 50,
                  
                          autoFillEnable: false,
                          textInputAction: TextInputAction.done,
                          onSubmit: (text) {
                           fotp=text;
                          },
                          onChange: (x) {
                            // Print.p(x.toString());
                          },
                          otpPinFieldInputType: OtpPinFieldInputType.none,
                  
                          otpPinFieldStyle: OtpPinFieldStyle(
                            defaultFieldBorderColor:
                            Colors.grey, // No border when inactive
                            activeFieldBorderColor:
                            Colors.black, // Border color when focused
                  
                            // Set background color for active field
                            activeFieldBackgroundColor: Colors.transparent,
                            filledFieldBackgroundColor: Colors
                                .transparent, // No background color for filled
                  
                            // Only show border on the bottom
                            filledFieldBorderColor:
                            Colors.transparent, // No border for filled field
                            // If needed, specify individual side borders for fine control
                          ),
                  
                          maxLength: 4,
                          showCursor: true,
                          cursorColor: Colors.black,
                          cursorWidth: 1,
                          mainAxisAlignment: MainAxisAlignment.center,
                          autoFocus: false,
                  
                          // Set to a custom decoration if necessary
                          otpPinFieldDecoration:
                          OtpPinFieldDecoration.defaultPinBoxDecoration,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Confirm PIN",
                          style: GoogleFonts.poppins(
                              fontSize: 26, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 60),
                        child: OtpPinField(
                          fieldHeight: 60,
                          fieldWidth: 50,
                  
                          autoFillEnable: false,
                          textInputAction: TextInputAction.done,
                          onSubmit: (text) {
                            sotp=text;
                          },
                          onChange: (x) {
                            // Print.p(x.toString());
                          },
                          otpPinFieldInputType: OtpPinFieldInputType.none,
                  
                          otpPinFieldStyle: OtpPinFieldStyle(
                            defaultFieldBorderColor:
                            Colors.grey, // No border when inactive
                            activeFieldBorderColor:
                            Colors.black, // Border color when focused
                  
                            // Set background color for active field
                            activeFieldBackgroundColor: Colors.transparent,
                            filledFieldBackgroundColor: Colors
                                .transparent, // No background color for filled
                  
                            // Only show border on the bottom
                            filledFieldBorderColor:
                            Colors.transparent, // No border for filled field
                            // If needed, specify individual side borders for fine control
                          ),
                  
                          maxLength: 4,
                          showCursor: true,
                          cursorColor: Colors.black,
                          cursorWidth: 1,
                          mainAxisAlignment: MainAxisAlignment.center,
                          autoFocus: false,
                  
                          // Set to a custom decoration if necessary
                          otpPinFieldDecoration:
                          OtpPinFieldDecoration.defaultPinBoxDecoration,
                        ),
                      )
                    ],
                  ),
                ),
              )),
          SizedBox(
            height: 100,
            child: Center(
              child: StandaredButton(
                title: "Continue",
                onPass: onVerify,
              ),
            ),
          )
        ],
      ),
    ),
    );
  }

  void onVerify()async {
if(fotp==sotp){
  var userData=await WrapOverHive.getUserData("userDetails");
  var response=await BaseApiServices.setPinApiService(pin: fotp, phoneNumber: userData!["phoneNumber"].toString());
  Print.p(response.toString());
  if(response!=null){
        Get.to(SuccessPage(
          title: "Successful",
          subTitle:
              "Your PIN has been successfully set up and is now ready to use",
          nextPage: AdminApprovalScreen(),
        ));
      }
    }
    // Get.to(SuccessPage(title: "Request Submitted",subTitle: "Your request for a free 1-week trial has been submitted and is pending approval.We'll notify you once it's activated!",));

  }
}
