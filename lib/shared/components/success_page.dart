import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/core/constants/text_style_constant.dart';
import 'package:market_hub_application/core/theme/theme.dart';

import '../../core/utils/utils.dart';

class SuccessPage extends StatelessWidget {
  String title;
  String subTitle;
  var nextPage;
  SuccessPage({this.title="", this.nextPage=null, this.subTitle=""}) ;

  @override
  Widget build(BuildContext context) {
    Print.p("in build method (success page)");
    nextPage!=null?Future.delayed(Duration(seconds: 1), () {
      Get.to(nextPage);
    }):"";
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    child: Image.asset(
                      "assets/splash_screeen_img/success.png",
                      height: 100,
                      width: 100,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 40),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      title,
                      style: TextStyleConstant.headerTextStyle,
                    ),
                  ),
                  Text(
                    subTitle,
                    textAlign: TextAlign.center,
                    style: TextStyleConstant.subHeaderTextStyle,
                  ),
                ],
              ),
            ),
            Expanded(flex: 1, child: Row())
          ],
        ),
      ),
    );
  }
}
