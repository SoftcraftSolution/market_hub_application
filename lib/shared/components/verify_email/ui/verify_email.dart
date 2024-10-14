import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/shared/widget/button/custom_button.dart';
import 'package:market_hub_application/core/theme/theme.dart';
import 'package:market_hub_application/shared/widget/text_fieled/custom_text_field.dart';

import '../../../../core/utils/utils.dart';
import '../controller/verify_email_controller.dart';

class VerifyEmail extends StatelessWidget {
  String title;
  String subTitle;

  var controller;
   VerifyEmail({required this.title,required this.subTitle,}){
     controller=VerifyEmailController(title: title,  subTitle: subTitle);
   }

  @override
  Widget build(BuildContext context) {
    // Print.p("build of verify email");

    return Scaffold(appBar: AppBar(leading: BackButton(),backgroundColor: Colors.transparent,),
    backgroundColor: ColorConstants.backgroundColor,
    body: Padding(
      padding: const EdgeInsets.all(28.0),
      child: Column(children: [
        Expanded(child: Column(
          children: [
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.only(bottom: 26),
              child: Text(
               title,
                style: GoogleFonts.poppins(
                    fontSize: 26, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 26),
              child: SizedBox(
                width: MediaQuery.of(context).size.width*0.75,
                child: Text(textAlign: TextAlign.center,
                  subTitle,
                  style: GoogleFonts.poppins(
                      fontSize: 18, color: Color(0xff646464)),
                ),
              ),
            ),
            CustomTextFeild(placeholder: "Enter registered email", controller: controller.emailCon,keyType: TextInputType.emailAddress,)
            // StandaredTextFeild(placeholder: "Phone Number", controller: phno,keyType: TextInputType.number,maxLength: ,)
          ],
        )),
        CustomButton(title: "Continue", onPress: controller.onVerifyEmail

        )],),
    ),
    );
  }
}
