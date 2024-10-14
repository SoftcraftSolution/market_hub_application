import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/core/constants/text_style_constant.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;

  const ConfirmationDialog({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      backgroundColor: ColorConstants.backgroundColor,
      title: Text(title,style: TextStyleConstant.dialogHeaderTextStyle,),
      content: Text(message,style: TextStyleConstant.dialogSubHeaderTextStyle,),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false); // Return false (Cancel)
          },
          child:  Text('No',style: GoogleFonts.poppins(color: ColorConstants.greyColor),),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true); // Return true (Confirm)
          },
          child:  Text('Confirm',style: GoogleFonts.poppins(color: ColorConstants.primeryColor),),
        ),
      ],
    );
  }
}
