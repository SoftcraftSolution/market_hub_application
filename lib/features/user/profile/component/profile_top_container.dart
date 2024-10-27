import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/utils/userDataCon.dart';

import '../../../../core/utils/utils.dart';

class ProfileTopContainer extends StatelessWidget {
  const ProfileTopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.withOpacity(0.1),
          border: Border.all(color: Colors.grey.withOpacity(0.6))),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 20),
          child: Column(
            children: [
              Text(UserDataController.userDetail!.name,style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600),),
              // Text("rahulkanoujiya@gmail.com",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600),),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(UserDataController.userDetail!.whatsappNumber,style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black.withOpacity(0.6)),),
              ),Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(UserDataController.userDetail!.email,style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black.withOpacity(0.6)),),
              ),
              Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/splash_screeen_img/logo.png",height: 70,width: 70,),
                  Expanded(child: Text(textAlign: TextAlign.center,UserDataController.userDetail!.plan!,style: GoogleFonts.poppins(fontSize: 22,fontWeight: FontWeight.w700,color: Color(0xff1837BC)),)),
                  SizedBox(width: 70,)
                ],),
              Container(
                height: 17,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),

                child: LinearProgressIndicator(
                  value: calculateDaysPassedPercentage(DateTime.parse(UserDataController.userDetail!.planStartDate!), DateTime.parse(UserDataController.userDetail!.planEndDate!)), // Set progress to 60%
                  backgroundColor: Colors.grey[300], // Background color
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff008242)), // Progress color
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Amount",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.6)),),
                        Text("\u20B9 1600/year",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w700,color: Color(0xff1918BC),),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Expiry Date",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.6)),),
                        Text(formatDate(DateTime.parse(UserDataController.userDetail!.planEndDate.toString())),style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500,),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(onTap:(){customToast(msg: "Comming Soon..");}, child: Text("Benefits",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.6)),)),
                        Icon(Icons.arrow_forward_ios_sharp)
                      ],
                    ),
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
