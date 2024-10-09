import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';

class DialogService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void showNoInternetDialog() async{
    await showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: Icon(Icons.error_outline,color: ColorConstants.redColor,size: 60,),
          title: Text('No Internet Connection',style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w700,),),
          content: Text(textAlign: TextAlign.center,'Please check your internet settings and try again.',style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500,color: ColorConstants.greyColor),),
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
