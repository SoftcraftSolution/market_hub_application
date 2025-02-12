import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/shared/components/update_pin/api/api_service.dart';

import '../../../../core/api/api_services.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/utils/wrap_over_hive.dart';
import '../../../../features/user/registration/controllers/registration_controller.dart';
import '../../../../features/user/admin_approval/ui/admin_approval_screen.dart';
import '../../success_page.dart';

class SetPinController
{
  TextEditingController fotp=TextEditingController();
  TextEditingController sotp=TextEditingController();
  Widget nextPage;
  bool isResetPage;
  String email;
  SetPinController({required this.nextPage,required this.isResetPage,required this.email});

  Future<void> onVerify()async {
  if(validateInput()){
    Print.p(email);
    if(isResetPage){
      var result=await updatePin();
      result?Get.off(()=>nextPage):"";
    }else{
      saveInRegistCon();
      Get.off(()=>nextPage);
    }
  }
  }

  bool validateInput(){
    Print.p(fotp.text);
    Print.p(sotp.text);
    if((fotp.text)==(sotp.text)){
      if(fotp.text.length==4 ){
       return true;
      }
      else{
        customToast(msg: "Enter PIN");
        return false;
      }

    }else{
      customToast(msg: "Pin should be same");
      return false;
    }
  }

  void saveInRegistCon(){
    var userDataCon=Get.put(RegistrationCon());

      userDataCon.user!.setPin(pin: this.fotp.text);

  }

  Future<bool> updatePin()async{
  //  update pin
  //   call api
      if(email!=""){
    var response = await SetPinApiService().setPinApiService(
        pin: sotp.text.toString(), email: email);
    if(response!=null){
      var result=await updatePinLDB(sotp.text.toString());
      return result;
    }
    return false;
  }else{
return false;
      }
  //   update in locally


  }

}