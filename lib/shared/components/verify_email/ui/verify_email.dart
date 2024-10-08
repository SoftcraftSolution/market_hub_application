import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/shared/widget/custom_button.dart';
import 'package:market_hub_application/core/theme/theme.dart';

import '../controller/verify_email_controller.dart';

class VerifyEmail extends StatelessWidget {
  String title;
  String subTitle;
  Widget nextPage;
  var controller;
   VerifyEmail({required this.title,required this.subTitle,required this.nextPage});

  @override
  Widget build(BuildContext context) {
   controller=VerifyEmailController(title: title, nextPage: nextPage, subTitle: subTitle);
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.14),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.8)),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 6, horizontal: 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 60,
                        child: TextField(
                          controller: controller.countryCode,
                          maxLength: 3,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              counterText: '',
                              hintText: '+91 |',
                              hintStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400),
                              border: InputBorder.none),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          decoration: InputDecoration(
                              counterText: "",
                              hintText: 'Enter Phone Number',
                              hintStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400),
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // StandaredTextFeild(placeholder: "Phone Number", controller: phno,keyType: TextInputType.number,maxLength: ,)
          ],
        )),
        CustomButton(title: "Continue", onPress: controller.onVerifyNumber

        )],),
    ),
    );
  }
}
