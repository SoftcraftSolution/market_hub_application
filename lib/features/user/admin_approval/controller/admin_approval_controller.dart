import 'package:get/get.dart';
import 'package:market_hub_application/core/models/userdetail.dart';
import 'package:market_hub_application/core/utils/utils.dart';

import 'package:market_hub_application/core/utils/wrap_over_hive.dart';
import 'package:market_hub_application/features/home/ui/home_page.dart';
import 'package:market_hub_application/features/user/admin_approval/api/api_service.dart';
import 'package:market_hub_application/features/user/login/ui/login_screen.dart';

class AdminApprovalController{
  void checkApproval()async{
    UserDetail? userData=await WrapOverHive.getUserData();
    var response=await AdminApprovalAPiService().checkUserApprovalApiService(email: userData!.email);
    if(response!=null){
      if(response["isApproved"]==true){
        UserDetail? userData=await WrapOverHive.getUserData();
        userData!.isApproved=true;
        await WrapOverHive.locallizeUserData(userData);
        Get.offAll(LoginScreen());
      }else{
        customToast(msg: "Not Approved Yet");
      }
    }


  }
}