import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/utility/theme.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
            ),
            topSection(),
            SizedBox(height: 20,),
            Expanded(child:Column(
              children: [
                ProfileElements(leading: Center(child: Image.asset("assets/splash_screeen_img/logo.png")),title: "About Us",),
                ProfileElements(leading: Icon(Icons.call_outlined,size: 30,color: AppTheme.primeryColor,),title: "Contact Us",),
                ProfileElements(leading: Icon(Icons.account_balance_outlined,size: 30,color: AppTheme.primeryColor,),title: "Terms & Conditions",),
                ProfileElements(leading: Icon(Icons.feedback_outlined,size: 30,color: AppTheme.primeryColor,),title: "Feedback",),
                ProfileElements(leading: Icon(Icons.exit_to_app_rounded,size: 30,color: AppTheme.primeryColor,),title: "Log Out",isLast: true,),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget topSection() {
    return Container(
      // height: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.withOpacity(0.1),
          border: Border.all(color: Colors.grey.withOpacity(0.6))),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 20),
          child: Column(

            children: [
                   Text("Abhishek Dubey",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600),),
                   Padding(
                     padding: const EdgeInsets.only(top: 6),
                     child: Text("+91 1234567890",style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black.withOpacity(0.6)),),
                   ),
              Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Image.asset("assets/splash_screeen_img/logo.png",height: 70,width: 70,),
                Expanded(child: Text(textAlign: TextAlign.center,"Standard Plan",style: GoogleFonts.poppins(fontSize: 22,fontWeight: FontWeight.w700,color: Color(0xff1837BC)),)),
              SizedBox(width: 70,)
                ],),
              Container(
                height: 20,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),

                child: LinearProgressIndicator(
                  value: 0.6, // Set progress to 60%
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
                        Text("Amount",style: GoogleFonts.poppins(fontSize: 19,fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.6)),),
                        Text("\u20B9 1600/year",style: GoogleFonts.poppins(fontSize: 19,fontWeight: FontWeight.w700,color: Color(0xff1918BC),),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Expiry Date",style: GoogleFonts.poppins(fontSize: 19,fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.6)),),
                        Text("04/12/2024",style: GoogleFonts.poppins(fontSize: 19,fontWeight: FontWeight.w500,),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Benefits",style: GoogleFonts.poppins(fontSize: 19,fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.6)),),
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

class ProfileElements extends StatelessWidget{
  Widget leading;
  String title;
  bool isLast=true;
  ProfileElements({required this.leading,required this.title,this.isLast=false});

  Widget build (BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
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
    );
  }
}
