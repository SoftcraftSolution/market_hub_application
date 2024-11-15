import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/features/user/profile/pages/contact_us/controller/contact_us_con.dart';

class ContactUsScreen extends StatelessWidget {
  final con = ContactUsCon();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.backgroundColor,
        leading: BackButton(),
        centerTitle: true,
        title: Text(
          'Contact Us',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: screenWidth * 0.05,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
                child: Image.asset(
                  'assets/img/contactUs.png', // Replace with your actual image path
                  height: screenHeight * 0.25,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Column(
                children: [
                  Text(
                    'Seeking assistance?',
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'We are ready to help you anytime',
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.05),
              GestureDetector(
                onTap: con.launchDialer,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    child: Row(
                      children: [
                        Icon(
                          Icons.call,
                          color: Colors.black54,
                          size: screenWidth * 0.08,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.04,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Call Us",
                                  style: GoogleFonts.poppins(
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "Open from 10.00 am to 7.00 pm",
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: screenWidth * 0.034,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.grey,
                          size: screenWidth * 0.05,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
                child: Row(
                  children: [
                    Text(
                      "For further assistance,",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.mail_outline_rounded,
                    size: screenWidth * 0.08,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.04),
                    child: Text(
                      "Mail us to:",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: con.launchEmail,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                      child: Text(
                        "mhmarkethub@gmail.com",
                        style: GoogleFonts.poppins(
                          color: CupertinoColors.activeBlue,
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
