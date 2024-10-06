import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/components/verify_number/ui/verify_number.dart';

class ButtomLine extends StatelessWidget {
  const ButtomLine({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(VerifyNumber(title: "Verification",subTitle: "Enter your Phone number for Verification.",));
      },
      child: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'Already have an account? ',
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.black)),
            TextSpan(
                text: 'Login',
                style: GoogleFonts.poppins(color: Colors.blue, fontSize: 16)),
          ])),
    );;
  }
}
