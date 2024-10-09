// this file is for useer data locallization meethoods like storring data and deleting data

import 'package:market_hub_application/core/models/user_detail_model.dart';
import 'package:market_hub_application/core/utils/utils.dart';
import 'package:market_hub_application/core/utils/wrap_over_hive.dart';

// storing data in locally
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
// deleting  data of user
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
//get user data
Future<Map<dynamic,dynamic>?> getLocalUserDetail()async{
  var userData=await WrapOverHive.getUserData("userData");
  return userData;
}