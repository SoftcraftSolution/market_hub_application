import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/core/theme/theme.dart';


class StandaredButton extends StatelessWidget
{
  String title;
  VoidCallback onPass;
  StandaredButton({required this.title,required this.onPass});

  Widget build(BuildContext context)
  {
    var titleStyle=GoogleFonts.poppins(fontWeight: FontWeight.w700,fontSize: 18,color: Colors.white);
    return GestureDetector(
      onTap: onPass,
      child: Container(decoration:BoxDecoration(color:ColorConstants.primeryColor,borderRadius: BorderRadius.circular(15)),
        
        height: 60,
        child: Center(child:Text(title,style: titleStyle,)),),
    );
  }
}