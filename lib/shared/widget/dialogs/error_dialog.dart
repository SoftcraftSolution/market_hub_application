import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/core/constants/text_style_constant.dart';

class ErrorDialog {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void showErrorDialog({required String title,required String subTitle}) async{
    await showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorConstants.backgroundColor,
          icon: Icon(Icons.error_outline,color: ColorConstants.redColor,size: 80,),
          title: Text(title,style: TextStyleConstant.dialogHeaderTextStyle),
          content: Text(textAlign: TextAlign.center,subTitle,style:TextStyleConstant.dialogSubHeaderTextStyle,),
         actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              child: Text('Back',style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w700),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
