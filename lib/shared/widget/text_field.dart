import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFeild  extends StatelessWidget
{
  String placeholder;
  TextEditingController controller;
  TextInputType keyType;
  int maxLength;

  CustomTextFeild({required this.placeholder,required this.controller,this.keyType=TextInputType.text,this.maxLength=50});

  Widget build(BuildContext context){
    var backColor=Colors.grey.withOpacity(0.14);
    var padding=EdgeInsets.symmetric(horizontal: 20,vertical: 18);
    return Padding(

      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: controller,
        style: GoogleFonts.poppins(fontWeight: FontWeight.w300),
        keyboardType: keyType,
        maxLength: maxLength,

        decoration:  InputDecoration(
          contentPadding: padding,
          filled: true,
          fillColor: backColor,
          hintText:
          placeholder,
          counterText: '',


          hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.w400),
          focusedBorder: OutlineInputBorder(

              borderSide: BorderSide(width: 1,color: Colors.grey),
              borderRadius:BorderRadius.circular(15)
          ) ,
          enabledBorder:OutlineInputBorder(

              borderSide: BorderSide(width: 1,color: Colors.grey.withOpacity(0.8)),
              borderRadius:BorderRadius.circular(15)
          ) ,



        ),
      ),
    );
  }
}