import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/shared/components/update_pin/api/api_service.dart';

import '../../../../core/api/api_services.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/utils/wrap_over_hive.dart';
import '../../../../features/user/registration/controllers/registration_controller.dart';
import '../../../../features/user/registration/ui/admin_approval_screen.dart';
import '../../success_page.dart';

class SetPinController
{
  TextEditingController fotp=TextEditingController();
  TextEditingController sotp=TextEditingController();
  Widget nextPage;
  SetPinController({required this.nextPage});

  Future<void> onVerify()async {
    var userDataCon=Get.find<RegistrationCon>();
    if(fotp.text==sotp.text){

      Print.p("before${userDataCon.user!.pin.toString()}");
      userDataCon.user!.setPin(pin: this.fotp.text);
      Print.p("after${userDataCon.user!.pin.toString()}");
        Get.off(nextPage);
      // }
    }
    // Get.to(SuccessPage(title: "Request Submitted",subTitle: "Your request for a free 1-week trial has been submitted and is pending approval.We'll notify you once it's activated!",));

  }
}