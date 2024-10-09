import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/features/user/registration/widgets/buttom_line.dart';
import 'package:market_hub_application/features/user/registration/widgets/or_divider_widget.dart';
import 'package:market_hub_application/shared/widget/custom_button.dart';

import 'package:market_hub_application/shared/widget/custom_phone_number_text_field.dart';

import '../../../../core/constants/text_style_constant.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/utils/utils.dart';

import '../../../../shared/components/verify_otp/ui/verify_otp.dart';
import '../../../../shared/widget/custom_text_field.dart';
import '../controllers/registration_controller.dart';

class Registration extends StatelessWidget {

  var controller = Get.put(RegistrationCon());

  @override
  Widget build(BuildContext context) {
    var backColor = Colors.grey.withOpacity(0.14);
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
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
                    style: TextStyleConstant.headerTextStyle,
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
                          CustomTextFeild(
                              placeholder: "Enter Full Name",
                              controller: controller.nameCon,
                          maxLength: 50,),

                          PhoneNumberTextField(numberCon: controller.whatsappPhnoCon, countryCodeCon: controller.whatsappCountryCodeCon, placeHolder: "Enter WhatsApp Number"),
                          const SizedBox(height: 20),
                          PhoneNumberTextField(numberCon: controller.phnoCon, countryCodeCon: controller.countryCodeCon, placeHolder: "Enter Phone Number"),

                          const SizedBox(height: 20),
                          CustomTextFeild(
                            placeholder: "Enter Email Address",
                            controller: controller.emailCon,
                            keyType: TextInputType.emailAddress,
                            // maxLength: 8,
                          ),
                          CustomTextFeild(
                            placeholder: "Enter Pincode",
                            controller: controller.pincodeCon,
                            keyType: TextInputType.number,
                            maxLength: 8,
                          ),

                          Obx(
                            ()=> TextField(
                              style: TextStyleConstant.textFieldStyle,
                              readOnly: true,
                              onTap: selectImage,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: backColor,
                                hintText: controller.isUploaded.value?controller.finalName.value:"Visiting Card",
                                hintStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,color:ColorConstants.greyColor),
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
                                    borderRadius: BorderRadius.circular(20)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.grey.withOpacity(0.8)),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                ()=> Transform.scale(
                                  scale: 1.3,
                                  child: Checkbox(
                                    value: controller.isAcceptedTerms.value,
                                    onChanged: (value) {
                                      controller.setTerms(value!);
                                    },
                                    activeColor: ColorConstants.primeryColor, // Color of the checkbox when checked
                                    checkColor: Colors.white,  // Color of the checkmark
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Reduces touch target size
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      // side: BorderSide(color: Colors.grey,width: 2)
                                      // Rounded corners
                                    ),
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
                  CustomButton(
                    title: "Register",
                    onPress: controller.onRegister,
                  ),
                  OrDividerWidget(),
                  ButtomLine()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }



  void selectImage() async {
    var selected = await ImagePicker().pickImage(source: ImageSource.gallery);
    Print.p(selected!.path);
    controller.imgCon.text=selected!.path;
    controller.setUploadState(true);
    controller.setFileName(selected!.path.split("/").last);
  }


}


