import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/shared/components/update_pin/api/api_service.dart';

import '../../../../core/api/api_services.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/utils/wrap_over_hive.dart';
import '../../../../features/user/registration/ui/admin_approval_screen.dart';
import '../../success_page.dart';

class SetPinController
{
  String fotp;
  String sotp;
  Widget nextPage;
  SetPinController({required this.fotp,required this.sotp,required this.nextPage});

  void onVerify()async {
    if(fotp==sotp){
      var userData=await WrapOverHive.getUserData("userDetails");
      var response=await SetPinApiService().setPinApiService(pin: fotp, phoneNumber: userData!["phoneNumber"].toString());
      Print.p(response.toString());
      if(response!=null){
        Get.off(nextPage);
      }
    }
    // Get.to(SuccessPage(title: "Request Submitted",subTitle: "Your request for a free 1-week trial has been submitted and is pending approval.We'll notify you once it's activated!",));

  }
}