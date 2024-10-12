import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:market_hub_application/core/models/userdetail.dart';
import 'package:market_hub_application/core/utils/utils.dart';


class WrapOverHive{
  static Future<UserDetail?> getUserData()
  async{
    var box =await WrapOverHive.initBox();
    // await box.put("detail",UserDetail.fromMap(temp));
    final data= box.get("detail");
    return data;
  }
  static Future<bool> locallizeUserData(dynamic data)
  async{
    try{
      var box=await WrapOverHive.initBox();
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
    Box<UserDetail> box;

    // Check if the box is already open
    if (Hive.isBoxOpen('userdetail')) {
      box = Hive.box<UserDetail>('userdetail');
    } else {
      // Open the box if it's not open yet
      box = await Hive.openBox<UserDetail>('userdetail');
    }

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