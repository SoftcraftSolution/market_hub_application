import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileElements extends StatelessWidget{
  Widget leading;
  String title;
  bool isLast=true;
  VoidCallback onTap;
  ProfileElements({required this.leading,required this.title,this.isLast=false,required this.onTap});

  Widget build (BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(children: [
              SizedBox(height: 60,width: 60,child: leading,),
              Expanded(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(textAlign: TextAlign.start,title,style: GoogleFonts.poppins(fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.6),fontSize: 18),),
              )),
              Padding(
                padding: const EdgeInsets.only(right: 14),
                child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black.withOpacity(0.6),),
              ),

            ],),
            isLast?SizedBox():Divider(
              color: Colors.black.withOpacity(0.6),
              height: 10,
            )
          ],),
      ),
    );
  }
}
