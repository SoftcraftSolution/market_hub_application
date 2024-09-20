import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/screens/forget_pass_page.dart';
import 'package:market_hub_application/screens/registeration_screen/registration.dart';
import 'package:market_hub_application/utility/theme.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

import '../utility/utiliity.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppTheme.backgroundColor,
    body: Padding(
      padding:  EdgeInsets.symmetric(vertical: 40,horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,


        children: [
          Column(
            children: [
              Image.asset("assets/splash_screeen_img/logo.png",height: 120,width: 120,),
              Padding(
                padding: const EdgeInsets.only(bottom: 26),
                child: Text(
                  "Welcome Back",
                  style: GoogleFonts.poppins(
                      fontSize: 26, fontWeight: FontWeight.w700),
                ),
              ),
              Icon(Icons.lock,size: 46,color: Color(0xff1918BC),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 26),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.6,
                  child: Text(textAlign: TextAlign.center,
                    "Please enter your 4 Digit PIN to Login",
                    style: GoogleFonts.poppins(
                        fontSize: 18, color: Color(0xff646464)),
                  ),
                ),
              ),
            ],
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
          ),
          bottomLine(),
          GestureDetector(
            onTap: onChangePin,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                   'Change PIN',
                  style: GoogleFonts.poppins(color: Color(0xff1918BC), fontSize: 16)),
            ),
          ),


        ],
      ),
    ),
    );
  }
  Widget bottomLine() {
    return GestureDetector(
      onTap: () {
        Get.to(Registration());
      },
      child: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'Don’t have an account yet? ',
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.black)),
            TextSpan(
                text: 'Register',
                style: GoogleFonts.poppins(color: Color(0xff1918BC), fontSize: 16)),
          ])),
    );
  }
  void onChangePin(){
    Get.to(ForgetPassPage());
  }
}
