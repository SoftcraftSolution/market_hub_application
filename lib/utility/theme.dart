import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static var primeryColor=Color(0xffE76821);
  static var backgroundColor=Color(0xffffffff);
  static Widget appTextFeild({required String placeholder,required TextEditingController controller,TextInputType keyType=TextInputType.text,int maxLength=50}){
    var backColor=Colors.grey.withOpacity(0.14);
    var padding=EdgeInsets.symmetric(horizontal: 20,vertical: 18);
    return TextField(
      controller: controller,
      style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
      keyboardType: keyType,
      maxLength: maxLength,
      decoration:  InputDecoration(
        contentPadding: padding,
        filled: true,
        fillColor: backColor,
        hintText:
        placeholder,


        hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        focusedBorder: OutlineInputBorder(

            borderSide: BorderSide(width: 1,color: Colors.grey),
            borderRadius:BorderRadius.circular(15)
        ) ,
        enabledBorder:OutlineInputBorder(

            borderSide: BorderSide(width: 1,color: Colors.grey.withOpacity(0.8)),
            borderRadius:BorderRadius.circular(15)
        ) ,



      ),
    );
  }
}

class StandaredTextFeild  extends StatelessWidget
{
  String placeholder;
  TextEditingController controller;
  TextInputType keyType;
  int maxLength;

  StandaredTextFeild({required this.placeholder,required this.controller,this.keyType=TextInputType.text,this.maxLength=50});

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