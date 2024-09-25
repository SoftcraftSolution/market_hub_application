import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/modules/button.dart';
import 'package:market_hub_application/screens/enter_pin.dart';
import 'package:market_hub_application/screens/login_screen.dart';
import 'package:market_hub_application/utility/theme.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

import '../utility/utiliity.dart';

class VerifyOtp extends StatelessWidget {
  String otp;
  String enteredOtp="";
  // bool isRegistration;
   VerifyOtp({required this.otp,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(),
      ),
      backgroundColor: AppTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Verify Number",
                          style: GoogleFonts.poppins(
                              fontSize: 26, fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(
                          "Enter the code on your phone we just sent you",
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
                            enteredOtp=text;
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
   if(otp==enteredOtp){
      Get.to(EnterPinScreen());
   }else{
     standaredToast(msg: "Wrong pin",isErrorMsg: true);
   }

  }
}