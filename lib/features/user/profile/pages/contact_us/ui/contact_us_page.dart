import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/features/user/profile/pages/contact_us/controller/contact_us_con.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../core/utils/utils.dart';


class ContactUsScreen extends StatelessWidget {
var con=ContactUsCon();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.backgroundColor,
        leading: BackButton(),
        centerTitle: true,
        title: Text('Contact Us',style: GoogleFonts.poppins(fontWeight: FontWeight.w700),),

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Image.asset(
                  'assets/img/contactUs.png', // Replace with your actual image path
                  height: 200,
                ),
              ),
              SizedBox(height: 16),
              Column(
                children: [
                  Text(
                    'Seeking assistance?',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Text(
                    'We are ready to help you anytime',
                    style: GoogleFonts.poppins(fontSize: 20,  fontWeight: FontWeight.w600,),
                  ),
                ],
              ),
             SizedBox(height: 40,),
             GestureDetector(
               onTap: con.launchDialer,
               child: Container(
                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(color: Colors.grey)),
                 child: Padding(
                   padding: const EdgeInsets.all(12.0),
                   child: Row(children: [
                     Icon(Icons.call,color: Colors.black54,size: 30,),
                     Expanded(child: Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 20),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                         Text("Call Us",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600),),
                         Text("Open from 10.00 am to 7.00 pm",style: GoogleFonts.poppins(color:Colors.grey,fontSize: 16,fontWeight: FontWeight.w500),),
                       ],),
                     )),
                     Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,)
                   ],),
                 ),
               ),
             ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Text(textAlign: TextAlign.left,"For further assistance,",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500),),
                  ],
                ),
              ),
              Row(children: [
                Icon(Icons.mail_outline_rounded,size: 30,color: Colors.grey,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Mail us to:",style: GoogleFonts.poppins(fontSize: 16),),
                ),
                GestureDetector(
                  onTap: con.launchEmail,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text("mhmarkethub@gmail.com",style: GoogleFonts.poppins(color: CupertinoColors.activeBlue,fontSize: 16),),
                  ),
                )
              ],)
            ],
          ),
        ),
      ),
    );
  }

}