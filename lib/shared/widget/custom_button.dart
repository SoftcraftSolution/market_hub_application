import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';

import '../../core/utils/utils.dart';

class CustomButton extends StatefulWidget {
  final String title;
  Future<void> Function() onPress;

  CustomButton({required this.title, required this.onPress});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    var titleStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      fontSize: 18,
      color: Colors.white,
    );

    return GestureDetector(
      onTap: _isLoading ? inProgreessMegs: notInLoading,
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstants.primeryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        height: 60,
        child: Center(
          child: _isLoading
              ? SizedBox(
            height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
              )
              : Text(widget.title, style: titleStyle),
        ),
      ),
    );
  }
  void inProgreessMegs(){
    customToast(msg: "Loading...");
  }
  void notInLoading() async {
    // Print.p("on tap ");
    setState(() {
      _isLoading = true; // Show the progress indicator
    });
    await widget.onPress(); // Execute the method
    setState(() {
      _isLoading = false; // Hide the progress indicator
    });
  }
}
