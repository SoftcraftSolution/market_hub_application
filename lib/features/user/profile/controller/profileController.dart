import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/features/user/registration/ui/registration.dart';

import '../../../../core/utils/utils.dart';
import '../../../../shared/widget/dialogs/confirmation_dialog.dart';

class ProfilController{
  void onLogOut()async{
    bool? confirm = await showDialog<bool>(
      context: Get.context!,
      builder: (BuildContext context) {
        return ConfirmationDialog(
          title: 'Are you sure?',
          message: 'Do you want to Logout?',
        );
      },
    );
    if(confirm==true){
     await onConfirmLogOut();
    };

  }

  Future<void> onConfirmLogOut()async{
    Print.p("in Logout");
    var result=await logOut();
    if(result){
      Get.offAll(Registration());
    }else{
      customToast(msg: "Failed to logout");
    }
  }

  Future<void> onUpgradePlan()async{
    Print.p("onUpgrade Plan");
    Get.snackbar("Comming Soon...", "");
  }


}