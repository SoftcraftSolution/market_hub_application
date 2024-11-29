import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:market_hub_application/core/models/userdetail.dart';
import 'package:market_hub_application/core/utils/wrap_over_hive.dart';
import 'package:intl/intl.dart';


  /// Method to format DateTime to dd/MM/yyyy
  String formatDate(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }
  double calculateDaysPassedPercentage(DateTime startDate, DateTime endDate) {
    // Get the current date
    DateTime currentDate = DateTime.now();

    // Calculate total days between start and end dates
    int totalDays = endDate.difference(startDate).inDays;

    // Calculate the number of days passed from start date to current date
    int daysPassed = currentDate.difference(startDate).inDays;

    // Calculate percentage of days passed
    double percentage = (daysPassed / totalDays) * 100;

    // Ensure the percentage is between 0 and 100
    return percentage/100;
  }

String diffFormatDate(DateTime date) {
  final Duration difference = DateTime.now().difference(date);

  if (difference.inDays > 0) {
    return '${difference.inDays}d ago';
  } else if (difference.inHours > 0) {
    return '${difference.inHours}h ago';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes}m ago';
  } else {
    return 'Just now';
  }
}

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

Future<bool> updatePinLDB(String newPin)async{
  UserDetail? user=await WrapOverHive.getUserData();
  if(user!=null){
    user.pin=newPin;
    bool result=await WrapOverHive.locallizeUserData(user);
    return result;
  }
  return false;

}

String formatDateTime(DateTime dateTime) {
  final DateFormat formatter = DateFormat('dd MMM hh:mma');
  String formattedDate = formatter.format(dateTime).toLowerCase();
  return formattedDate;
}

