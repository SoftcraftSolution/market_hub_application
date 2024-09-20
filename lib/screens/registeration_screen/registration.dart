import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:market_hub_application/modules/button.dart';
import 'package:market_hub_application/screens/login_screen.dart';
import 'package:market_hub_application/screens/registeration_screen/controller.dart';
import 'package:market_hub_application/screens/verifyNumber.dart';

import '../../utility/theme.dart';
import '../../utility/utiliity.dart';

class Registration extends StatelessWidget {

  var controller = Get.put(RegistrationCon());
  TextEditingController nameCon = TextEditingController();
  TextEditingController pincodeCon = TextEditingController();
  TextEditingController stateCon = TextEditingController();
  TextEditingController cityCon = TextEditingController();
  TextEditingController imgCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var backColor = Colors.grey.withOpacity(0.14);
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Hello there,",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Register Account",
                    style: GoogleFonts.poppins(
                        fontSize: 26, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Expanded(
                  flex: 9,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          // name
                          StandaredTextFeild(
                              placeholder: "Enter Full Name",
                              controller: nameCon),
                          SizedBox(height: 16),
                          // phone number
                          Container(
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
                          const SizedBox(height: 16),
                          StandaredTextFeild(
                            placeholder: "Enter Pincode",
                            controller: pincodeCon,
                            keyType: TextInputType.number,
                            maxLength: 6,
                          ),
                          const SizedBox(height: 16),
                          StandaredTextFeild(
                              placeholder: "Enter City", controller: cityCon),
                          const SizedBox(height: 16),
                          StandaredTextFeild(
                              placeholder: "Enter State", controller: stateCon),
                          const SizedBox(height: 16),
                          Obx(
                            ()=> TextField(

                              readOnly: true,
                              onTap: selectImage,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: backColor,
                                hintText: controller.isUploaded.value?controller.finalName.value:"Visiting Card (Optional)",
                                hintStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400),
                                suffixIcon: Icon(
                                  Icons.upload,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 18),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.grey.withOpacity(0.8)),
                                    borderRadius: BorderRadius.circular(15)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.grey.withOpacity(0.8)),
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Transform.scale(
                                scale: 1.3,
                                child: Checkbox(
                                  value: true,
                                  onChanged: (value) {},
                                  activeColor: AppTheme.primeryColor, // Color of the checkbox when checked
                                  checkColor: Colors.white,  // Color of the checkmark
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Reduces touch target size
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    // side: BorderSide(color: Colors.grey,width: 2)
                                    // Rounded corners
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "By continuing you accept our Privacy Policy and Term of Use",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                      color: Colors.black.withOpacity(0.7)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
              Column(
                children: [
                  StandaredButton(
                    title: "Register",
                    onPass: onRegister,
                  ),
                  or(),
                  bottomLine()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget or() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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

  Widget bottomLine() {
    return GestureDetector(
      onTap: () {
       Get.to(LoginScreen());
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
    );
  }

  void selectImage() async {
    var selected = await ImagePicker().pickImage(source: ImageSource.gallery);
    Print.p(selected!.path);
    imgCon.text=selected!.path;
    controller.setUploadState(true);
    controller.setFileName(selected!.path.split("/").last);
  }

  void onRegister(){
    Get.to(Verifynumber());
  }
}


