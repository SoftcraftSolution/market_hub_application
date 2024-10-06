import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market_hub_application/core/utils/wrap_over_hive.dart';

class Print{
  static void p(String value){
    debugPrint('YOUR LOG  ====> $value');
  }
}

Future<bool?> customToast({required String msg, bool isErrorMsg = false})
async
{
  return Fluttertoast.showToast(msg: msg,backgroundColor: Colors.grey,textColor: isErrorMsg?Color(0xFFED6366):Colors.white);
}

