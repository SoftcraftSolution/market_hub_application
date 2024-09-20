import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/modules/button.dart';
import 'package:market_hub_application/screens/verifyNumber.dart';
import 'package:market_hub_application/utility/theme.dart';

class ForgetPassPage extends StatelessWidget {
  const ForgetPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    var phno=TextEditingController();
    return Scaffold(appBar: AppBar(leading: BackButton(),backgroundColor: Colors.transparent,),
    backgroundColor: AppTheme.backgroundColor,
    body: Padding(
      padding: const EdgeInsets.all(28.0),
      child: Column(children: [
        Expanded(child: Column(
          children: [
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.only(bottom: 26),
              child: Text(
                "Forget PIN ?",
                style: GoogleFonts.poppins(
                    fontSize: 26, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 26),
              child: SizedBox(
                width: MediaQuery.of(context).size.width*0.75,
                child: Text(textAlign: TextAlign.center,
                  "Enter your Phone number to reset your PIN.",
                  style: GoogleFonts.poppins(
                      fontSize: 18, color: Color(0xff646464)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.14),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.8)),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 6, horizontal: 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 60,
                        child: TextField(
                          maxLength: 3,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              counterText: '',
                              hintText: '+91  |',
                              hintStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400),
                              border: InputBorder.none),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          decoration: InputDecoration(
                              counterText: "",
                              hintText: 'Enter Phone Number',
                              hintStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400),
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // StandaredTextFeild(placeholder: "Phone Number", controller: phno,keyType: TextInputType.number,maxLength: ,)
          ],
        )),
        StandaredButton(title: "Continue", onPass: (){
          Get.to(Verifynumber());
        })

      ],),
    ),
    );
  }
}
