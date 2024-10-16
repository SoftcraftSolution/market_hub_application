import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TestScreen extends StatelessWidget {
  String screenName;
   TestScreen(this.screenName);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(screenName,  style: GoogleFonts.poppins(
        fontWeight: FontWeight.w700, fontSize: 16),),);
  }
}
