import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileElements extends StatelessWidget {
  final Widget leading;
  final String title;
  final bool isLast;
  final VoidCallback onTap;

  ProfileElements({
    required this.leading,
    required this.title,
    this.isLast = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width * 0.04;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.075,
                width: MediaQuery.of(context).size.width * 0.15,
                child: leading,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.04,
                  ),
                  child: Text(
                    title,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.6),
                      fontSize: fontSize,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.04,
                ),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black.withOpacity(0.6),
                  size: MediaQuery.of(context).size.width * 0.05,
                ),
              ),
            ],
          ),
          isLast
              ? SizedBox()
              : Divider(
            color: Colors.black.withOpacity(0.6),
            height: MediaQuery.of(context).size.height * 0.015,
          ),
        ],
      ),
    );
  }
}
