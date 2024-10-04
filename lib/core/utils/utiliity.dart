import 'package:flutter/cupertino.dart';
import 'package:market_hub_application/core/utils/wrap_over_hive.dart';

class Print{
  static void p(String value){
    debugPrint('YOUR LOG  ====> $value');
  }
}

Future<bool> localizeUserData(Map<dynamic,dynamic> data) async{
  try{

    WrapOverHive.setUserData("userData", data);
    Print.p("Successfully addeed  data into box");
    var get_data=await WrapOverHive.getUserData("userData");
    Print.p("After geting data");
    Print.p("type of data=>${get_data.runtimeType.toString()}");
    Print.p(" data=>${get_data.toString()}");
    return true;
  }
  catch(x){
    Print.p("Exception in  Localzation of Data=>${x.toString()}");
    return false;
  }

}

Future<bool> logOut()async{
  try{
    var result=await WrapOverHive.clearUserData();
    if(result)
    {
      return true;
    }
    return false;
  }catch(e)
  {
    Print.p("Exception while logout method call");
    return false;
  }
}