import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/text_style_constant.dart';

import '../../core/constants/color_constant.dart';

class PhoneNumberTextField extends StatelessWidget {
  var numberCon;
  var countryCodeCon;
  String placeHolder;
   PhoneNumberTextField({required this.numberCon,required this.countryCodeCon,required this.placeHolder});

  @override
  Widget build(BuildContext context) {
    countryCodeCon.text="+91";
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.14),
          border: Border.all(
              color: Colors.grey.withOpacity(0.8)),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 6, horizontal: 15),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 35,
              child: TextField(
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,color:ColorConstants.textFieldTextColor),
                controller: countryCodeCon,
                maxLength: 3,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(

                    counterText: '',
                    hintText: '+91  |',
                    hintStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,color:ColorConstants.textFieldTextColor),
                    border: InputBorder.none),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(height: 30,decoration: BoxDecoration(border: Border.all(color: Colors.grey.withOpacity(0.5))),),
            ),
            Expanded(
              child: TextField(
                style:TextStyleConstant.textFieldStyle ,controller: numberCon,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                    counterText: "",
                    hintText: placeHolder,
                    hintStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,color:ColorConstants.textFieldTextColor),
                    border: InputBorder.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
