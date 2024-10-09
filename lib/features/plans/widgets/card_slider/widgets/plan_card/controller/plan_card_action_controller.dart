import 'package:get/get.dart';
import 'package:market_hub_application/core/utils/user_utils.dart';
import 'package:market_hub_application/core/utils/utils.dart';
import 'package:market_hub_application/features/user/registration/api/registration_api_service.dart';
import 'package:market_hub_application/features/user/registration/controllers/registration_controller.dart';
import 'package:market_hub_application/features/user/registration/ui/admin_approval_screen.dart';
import 'package:market_hub_application/shared/components/success_page.dart';

class PlanCardActionController {
  int amount;
  String planName;
  PlanCardActionController({required this.amount, required this.planName});

  Future<void> onTryNow() async {
    Get.find<RegistrationCon>().user!.setPlan(plan: planName);
    var response = await RegistrationApiService()
        .registrationApiService(user: Get.find<RegistrationCon>().user!);
    if (response != null) {
      await localizeUserData(response);
      Get.off(SuccessPage(
        title: "Request Submitted",
        subTitle:
            "Your request for a free 1-week trial has been submitted and is pending approval. We'll notify you once it's activated!",
        nextPage: AdminApprovalScreen(),
      ));
    }
    Print.p(Get.find<RegistrationCon>().user!.toString());
  }

  Future<void> onBuyNow() async {
    Print.p("on BuyNow");
    customToast(msg: planName);
  }
}
