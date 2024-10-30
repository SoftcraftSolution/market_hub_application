// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:market_hub_application/core/constants/color_constant.dart';
// import 'package:market_hub_application/core/models/userdetail.dart';
// import 'package:market_hub_application/core/utils/wrap_over_hive.dart';
// import 'package:market_hub_application/features/user/login/widgets/login_buttom_line.dart';
// import 'package:market_hub_application/core/theme/theme.dart';
// import 'package:market_hub_application/shared/components/verify_email/ui/verify_email.dart';
// import 'package:market_hub_application/shared/widget/dialogs/error_dialog.dart';
// import 'package:otp_pin_field/otp_pin_field.dart';
//
// import '../../../../core/utils/utils.dart';
// import '../../naviagtion/ui/navigation.dart';
// import '../../registration/ui/registration.dart';
//
// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(backgroundColor: ColorConstants.backgroundColor,
//     body: Padding(
//       padding:  EdgeInsets.symmetric(vertical: 40,horizontal: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//
//
//         children: [
//           Column(
//             children: [
//               Image.asset("assets/splash_screeen_img/logo.png",height: 120,width: 120,),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 26),
//                 child: Text(
//                   "Welcome Back",
//                   style: GoogleFonts.poppins(
//                       fontSize: 26, fontWeight: FontWeight.w700),
//                 ),
//               ),
//               Icon(Icons.lock,size: 46,color: Color(0xff1918BC),),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 26),
//                 child: SizedBox(
//                   width: MediaQuery.of(context).size.width*0.6,
//                   child: Text(textAlign: TextAlign.center,
//                     "Please enter your 4 Digit PIN to Login",
//                     style: GoogleFonts.poppins(
//                         fontSize: 18, color: Color(0xff646464)),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 60),
//             child: OtpPinField(
//
//               fieldHeight: 60,
//               fieldWidth: 50,
//
//
//               autoFillEnable: false,
//               textInputAction: TextInputAction.done,
//               onSubmit: (text)async {
//                 await checkPin(text);
//               },
//               onChange: (x) {
//                 // Print.p(x.toString());
//               },
//               otpPinFieldInputType: OtpPinFieldInputType.password,
//
//               otpPinFieldStyle: OtpPinFieldStyle(
//                 defaultFieldBorderColor:
//                 Colors.grey, // No border when inactive
//                 activeFieldBorderColor:
//                 Colors.black, // Border color when focused
//
//                 // Set background color for active field
//                 activeFieldBackgroundColor: Colors.transparent,
//                 filledFieldBackgroundColor: Colors
//                     .transparent, // No background color for filled
//
//                 // Only show border on the bottom
//                 filledFieldBorderColor:
//                 Colors.transparent, // No border for filled field
//                 // If needed, specify individual side borders for fine control
//               ),
//
//               maxLength: 4,
//               showCursor: true,
//               cursorColor: Colors.black,
//               cursorWidth: 1,
//               mainAxisAlignment: MainAxisAlignment.center,
//               autoFocus: false,
//
//               // Set to a custom decoration if necessary
//               otpPinFieldDecoration:
//               OtpPinFieldDecoration.defaultPinBoxDecoration,
//             ),
//           ),
//           LoginButtomLine(),
//           GestureDetector(
//             onTap: onChangePin,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10),
//               child: Text(
//                    'Forget PIN',
//                   style: GoogleFonts.poppins(color: Color(0xff1918BC), fontSize: 16)),
//             ),
//           ),
//
//
//         ],
//       ),
//     ),
//     );
//   }
//
//   void onChangePin(){
//     Get.to(VerifyEmail(title: "Forget PIN ?",subTitle: "Enter your Email to reset your PIN.",));
//   }
//
//   Future<void> checkPin(String enteredPin)async{
//     UserDetail? user= await WrapOverHive.getUserData();
//     Print.p(user.toString());
//     if(user!.pin==enteredPin){
//       Get.offAll(()=>Home());
//     }
//     else{
//       ErrorDialog.showErrorDialog(title: "Wrong PIN Entered", subTitle: "Please re-enter your PIN to proceed.");
//     }
//
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';// Import local_auth
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/core/models/userdetail.dart';
import 'package:market_hub_application/core/utils/wrap_over_hive.dart';
import 'package:market_hub_application/features/user/login/widgets/login_buttom_line.dart';
import 'package:market_hub_application/shared/components/verify_email/ui/verify_email.dart';
import 'package:market_hub_application/shared/widget/dialogs/error_dialog.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import '../../naviagtion/ui/navigation.dart'; // For Home navigation

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

// Initialize local_auth
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/splash_screeen_img/logo.png",
                  height: 120,
                  width: 120,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 26),
                  child: Text(
                    "Welcome Back",
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Icon(Icons.lock, size: 46, color: Color(0xff1918BC)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 26),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      textAlign: TextAlign.center,
                      "Please enter your 4 Digit PIN to Login",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Color(0xff646464),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: OtpPinField(
                onChange: (x){},
                fieldHeight: 60,
                fieldWidth: 50,
                autoFillEnable: false,
                textInputAction: TextInputAction.done,
                onSubmit: (text) async {
                  await checkPin(text);
                },
                otpPinFieldInputType: OtpPinFieldInputType.password,
                otpPinFieldStyle: OtpPinFieldStyle(
                  defaultFieldBorderColor: Colors.grey,
                  activeFieldBorderColor: Colors.black,
                ),
                maxLength: 4,
                showCursor: true,
                cursorColor: Colors.black,
                cursorWidth: 1,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
            LoginButtomLine(),
            GestureDetector(
              onTap: onChangePin,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Forget PIN',
                  style: GoogleFonts.poppins(
                    color: Color(0xff1918BC),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Navigate to PIN reset screen
  void onChangePin() {
    Get.to(() => VerifyEmail(
      title: "Forget PIN?",
      subTitle: "Enter your Email to reset your PIN.",
    ));
  }

  // Check if the entered PIN is correct
  Future<void> checkPin(String enteredPin) async {
    UserDetail? user = await WrapOverHive.getUserData();
    if (user != null && user.pin == enteredPin) {
      Get.offAll(() => Home()); // Navigate to Home on success
    } else {
      ErrorDialog.showErrorDialog(
        title: "Wrong PIN Entered",
        subTitle: "Please re-enter your PIN to proceed.",
      );
    }
  }
}


