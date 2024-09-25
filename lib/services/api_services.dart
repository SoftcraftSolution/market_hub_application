
import 'dart:convert';

import 'package:dio/dio.dart';

import '../utility/theme.dart';
import '../utility/utiliity.dart';

class ResponseStructure {
  static Map<String, dynamic> toResponseStructure(Response r) {
    return jsonDecode(r.toString());
  }
}

class ApiServices {
  static var endPoint = 'https://market-hub-backend-kappa.vercel.app';
  static var dio=Dio();

  static Future<Map<String, dynamic>?> registrationApiService(
      {required String fullname,
      required String phoneNumber,
      required String pincode,
      required String city,
      required String state,
      String visitingCard = ""}) async {
    // Print.p("in Login api ");
    try {
      var finalPath = "/user/create-registration";
      finalPath = "$endPoint$finalPath";
      FormData data =FormData.fromMap({
        "fullName": fullname,
        "phoneNumber": phoneNumber,
        "pincode": pincode,
        "city": city,
        "state": state,
      });
      if (visitingCard != "") {
        var file=await MultipartFile.fromFile(visitingCard);
        data.files.add(MapEntry(
            "visitingCard",file ));
      }

    // data= FormData.fromMap(data);
      Response res = await dio.post(finalPath, data: data);
      return ResponseStructure.toResponseStructure(res);
      // await Future.delayed(Duration(seconds: 3),(){
      //   Print.p("After 3secound call back function");
      // });
    } catch (e) {
      // Print.p("Some thing went wrong in login");
      Print.p("in edit note Exception:${e.toString()}");
      standaredToast(msg: "Something went wrong regisration");
    }
  }

  static Future<Map<String, dynamic>?> setPinApiService(
      {required String pin,
        required String phoneNumber,
        }) async {
    // Print.p("in Login api ");
    try {
      var finalPath = "/user/create-pin";
      finalPath = "$endPoint$finalPath";
      var data = {
        "phoneNumber":phoneNumber,
        "pin":int.parse(pin)

      };


      // data= FormData.fromMap(data);
      Response res = await dio.post(finalPath, data: data);
      return ResponseStructure.toResponseStructure(res);
      // await Future.delayed(Duration(seconds: 3),(){
      //   Print.p("After 3secound call back function");
      // });
    } catch (e) {
      // Print.p("Some thing went wrong in login");
      Print.p("in registration Exception:${e.toString()}");
      standaredToast(msg: "Something went wrong setPin controlleer");
    }
  }
}
