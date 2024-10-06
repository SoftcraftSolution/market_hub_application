import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../registration/ui/registration.dart';

class LoginButtomLine extends StatelessWidget {
  const LoginButtomLine({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(Registration());
      },
      child: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'Don’t have an account yet? ',
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.black)),
            TextSpan(
                text: 'Register',
                style: GoogleFonts.poppins(color: Color(0xff1918BC), fontSize: 16)),
          ])),
    );
  }
}
