import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:market_hub_application/modules/button.dart';
import 'package:market_hub_application/screens/registeration_screen/controller.dart';


import '../../utility/theme.dart';
import '../../utility/utiliity.dart';


class Registration extends StatelessWidget {
   Registration({super.key});
   var controller=Get.put(RegistrationCon());
  TextEditingController nameCon=TextEditingController();
  TextEditingController pincodeCon=TextEditingController();
  TextEditingController stateCon=TextEditingController();
  TextEditingController cityCon=TextEditingController();
  TextEditingController imgCon=TextEditingController();

  @override
  Widget build(BuildContext context) {
    int borderRadius=15;
    var backColor=Colors.grey.withOpacity(0.14);
    var padding=EdgeInsets.symmetric(horizontal: 20,vertical: 18);
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: Column(children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            Text("Hello there,",style: GoogleFonts.poppins(fontSize: 20,),),
            Text("Register Account",style: GoogleFonts.poppins(fontSize: 26,fontWeight: FontWeight.w700),),

          ],),
          Expanded(flex:9,child: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  // name
                  StandaredTextFeild(placeholder: "Enter Full Name", controller: nameCon),
                   SizedBox(height: 16),
                  // phone number
                  Container(
                    decoration: BoxDecoration(color:Colors.grey.withOpacity(0.14),border: Border.all(color: Colors.grey.withOpacity(0.8)),borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 15),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width:60,
                            child: TextField(
                              maxLength: 3,

                              keyboardType: TextInputType.number,
                              decoration:  InputDecoration(
                                counterText: '',
                                hintText: '+91  |',
                                  hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.w400),
                                border:InputBorder.none
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              maxLength: 10,

                              decoration:  InputDecoration(
                                counterText: "",
                                hintText: 'Enter Phone Number',
                                  hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.w400),

                                  border:InputBorder.none

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  StandaredTextFeild(placeholder: "Enter Pincode", controller: pincodeCon,keyType: TextInputType.number,maxLength: 6,),
                  const SizedBox(height: 16),
                  StandaredTextFeild(placeholder: "Enter City", controller: cityCon),
                  const SizedBox(height: 16),
                  StandaredTextFeild(placeholder: "Enter State", controller: stateCon),
                  const SizedBox(height: 16),
                  TextField(
                    controller: imgCon,
                    readOnly: true,
                   onTap: selectImage,
                   decoration: InputDecoration(
                     filled: true,
                     fillColor: backColor,
                     hintText: "Visiting Card (Optional)",
                     hintStyle:  GoogleFonts.poppins(fontWeight: FontWeight.w400),
                     suffixIcon: Icon(Icons.upload,color: Colors.black.withOpacity(0.6),),
                     contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 18),
                     enabledBorder:OutlineInputBorder(

                         borderSide: BorderSide(width: 1,color: Colors.grey.withOpacity(0.8)),
                         borderRadius:BorderRadius.circular(15)
                     ) ,  focusedBorder:OutlineInputBorder(

                         borderSide: BorderSide(width: 1,color: Colors.grey.withOpacity(0.8)),
                         borderRadius:BorderRadius.circular(15)
                     ) ,
                   ),
                  )


                ],
              ),
            ),
          )),
          Column(
            children: [
              StandaredButton(title: "Register",onPass: (){Print.p("clicked");},),
              or(),
              bottomLine()
            ],
          ),
        ],),
      ),),);
  }
}
Widget or(){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 16),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Expanded(child: Divider()),
        Text(" Or "),
        Expanded(child: Divider()),
      ],
    ),
  );
}

Widget bottomLine(){
  return GestureDetector(
    onTap: (){
      Print.p("Login ==");
    },
      child: RichText(text: TextSpan(children: [
      TextSpan(text: 'Already have an account? ',style: GoogleFonts.poppins(fontSize: 16,color: Colors.black)),
      TextSpan(text: 'Login',style: GoogleFonts.poppins(color: Colors.blue,fontSize: 16)),

    ])),
  );
}

Widget selectButton(){
  return ElevatedButton(

    onPressed: (){}, child: Text("Select File"),
  style: ButtonStyle(
    fixedSize: WidgetStateProperty.all(Size(10,200)),
    backgroundColor: WidgetStateProperty.all(AppTheme.primeryColor)
  ),
  );
}

void selectImage()async{
  var selected=await ImagePicker().pickImage(source: ImageSource.gallery);
  Print.p(selected!.path);
}
