import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/features/user/registration/api/registration_api_service.dart';

import '../../../../core/api/api_services.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/utils/wrap_over_hive.dart';
import '../../../../shared/components/verify_otp/ui/verify_otp.dart';

class RegistrationCon extends GetxController{
  RxBool isUploaded=false.obs;
  RxBool isAcceptedTerms=false.obs;
  RxString finalName="".obs;
  TextEditingController nameCon = TextEditingController();
  TextEditingController pincodeCon = TextEditingController();
  TextEditingController stateCon = TextEditingController();
  TextEditingController cityCon = TextEditingController();
  TextEditingController imgCon = TextEditingController();
  TextEditingController phnoCon = TextEditingController();
  TextEditingController countryCodeCon = TextEditingController(text: "+91");

  void setUploadState(var newValue){
    if(newValue!=isUploaded.value){
      isUploaded.value=newValue;
    }
  }
  void setFileName(String finalName)
  {
    this.finalName.value=finalName;
  }
  void setTerms(bool newValue)
  {
    this.isAcceptedTerms.value=newValue;
  }

  void onRegister()async
  {
    var fullName=this.nameCon.text;
    var countryCode=this.countryCodeCon.text;
    var phno=this.phnoCon.text;
    var pincode=this.pincodeCon.text;
    var city=this.cityCon.text;
    var state=this.stateCon.text;
    var visityCard=this.imgCon.text;
    try{
      if (fullName != "") {
        if((countryCode.length>=2) && (countryCode.contains("+"))){
          if(phno.length==10){
            if(pincode.length>=4 && pincode.length<=8)
            {
              if(city!="" && state!=""){
                if(isAcceptedTerms.value){
                  var response=await RegistrationApiService().registrationApiService(fullname: fullName, phoneNumber: "$countryCode$phno", pincode: pincode, city: city, state: state,visitingCard: visityCard);
                  Print.p("response=>$response");
                  if(response!=null){
                    Print.p((response!=null).toString());
                    // Get.to(VerifyOtp(otp: response["otp"].toString()));
                    WrapOverHive.setUserData("userDetails", response["registration"]);
                  }
                }else{
                  customToast(msg: "Accept Term and Conditions");
                }
              }else{
                customToast(msg: "Invailid City or State");
              }

            }else{
              customToast(msg: "Invailid Pincode");
            }

          }else{
            customToast(msg: "Invailid Phone number");
          }

        }else{
          customToast(msg: "Invailid Country Code");
        }

      }else{
        customToast(msg: "full name required");
      }
    }
    catch(e){
      customToast(msg: "Something went wrong...");
    }
  }


}