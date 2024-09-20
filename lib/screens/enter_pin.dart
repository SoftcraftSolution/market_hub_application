import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/screens/admin_approval_screen.dart';
import 'package:market_hub_application/screens/success_page.dart';
import 'package:market_hub_application/utility/theme.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

import '../modules/button.dart';
import '../utility/utiliity.dart';

class EnterPinScreen extends StatelessWidget {
  bool isResetPinPage;
   EnterPinScreen({super.key,this.isResetPinPage=false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppTheme.backgroundColor,
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
                          print('Entered pin is $text');
                        },
                        onChange: (x) {
                          Print.p(x.toString());
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
                          print('Entered pin is $text');
                        },
                        onChange: (x) {
                          Print.p(x.toString());
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

  void onVerify() {
    Print.p("on Continue...");
    Get.to(SuccessPage(title: "Successful",subTitle: "Your PIN has been successfully set up and is now ready to use",nextPage: AdminApprovalScreen(),));
    // Get.to(SuccessPage(title: "Request Submitted",subTitle: "Your request for a free 1-week trial has been submitted and is pending approval.We'll notify you once it's activated!",));

  }
}
