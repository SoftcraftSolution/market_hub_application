import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/core/models/userdetail.dart';
import 'package:market_hub_application/core/utils/utils.dart';
import 'package:market_hub_application/core/utils/wrap_over_hive.dart';
import 'package:market_hub_application/features/user/registration/api/registration_api_service.dart';
import 'package:market_hub_application/features/user/registration/controllers/registration_controller.dart';
import 'package:market_hub_application/features/user/admin_approval/ui/admin_approval_screen.dart';
import 'package:market_hub_application/shared/components/success_page.dart';

import '../../../../../../../shared/widget/dialogs/confirmation_dialog.dart';

class PlanCardActionController {
  int amount;
  String planName;
  PlanCardActionController({required this.amount, required this.planName});

  Future<void> onTryNow() async {
    bool? confirm = await showDialog<bool>(
      context: Get.context!,
      builder: (BuildContext context) {
        return ConfirmationDialog(
          title: 'Are you sure?',
          message: 'Do you want to continue with the selected plan?',
        );
      },
    );
    confirm==true?onConfirmTrial():"";
  }

  void onConfirmTrial()async{
    Get.put(RegistrationCon());
    Get.find<RegistrationCon>().user!.setPlan(plan: planName);
    var response = await RegistrationApiService()
        .registrationApiService(user: Get.find<RegistrationCon>().user!);
    if (response != null) {
      await WrapOverHive.locallizeUserData(
          UserDetail.fromMap(response["newRegistration"]));
      Get.off(SuccessPage(
        title: "Request Submitted",
        subTitle:
        "Your request for a free 1-week trial has been submitted and is pending approval. We'll notify you once it's activated!",
        nextPage: AdminApprovalScreen(),
      ));
      await Get.delete<RegistrationCon>(force: true);
    }
  }

  Future<void> onBuyNow() async {
    bool? confirm = await showDialog<bool>(
      context: Get.context!,
      builder: (BuildContext context) {
        return ConfirmationDialog(
          title: 'Are you sure?',
          message: 'Do you want to continue with the selected plan?',
        );
      },
    );
    confirm==true?onConfirmBuyPlan():"";

  }
  void onConfirmBuyPlan(){
    Print.p("on BuyNow");
    customToast(msg: planName);
  }
}
