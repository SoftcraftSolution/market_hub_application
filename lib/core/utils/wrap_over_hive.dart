import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:market_hub_application/core/models/userdetail.dart';
import 'package:market_hub_application/core/utils/utils.dart';


class WrapOverHive{
  static Future<UserDetail?> getUserData()
  async{
    var box =await Hive.openBox<UserDetail>("userDetail");
    // await box.put("detail",UserDetail.fromMap(temp));
    final data=await box.get("detail");
    return data;
  }
  static Future<bool> locallizeUserData(dynamic data)
  async{
    try{
      var box=await initBox();
      // data=data.toMap();
      await box.put("detail",data);
      return true;
    }
    catch(e)
    {
      Print.p(e.toString());
      Print.p("Exception while calling setUserData");
      return false;
    }
  }

  static Future<Box> initBox()async{
    var box =await Hive.openBox("userDetail");

    return box;
  }

  static Future<bool> clearUserData()
  async
  {
   try {
      var box = await initBox();
      await box.clear();
      return true;
    }
    catch(e){
     Print.p("exception while clearing user data");
     return false;
    }
  }

}