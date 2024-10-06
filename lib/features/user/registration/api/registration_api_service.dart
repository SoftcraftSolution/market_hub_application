import 'package:dio/dio.dart';
import 'package:market_hub_application/core/api/api_services.dart';
import 'package:market_hub_application/core/constants/api_constant.dart';

import '../../../../core/models/response_structure.dart';
import '../../../../core/utils/utils.dart';

class RegistrationApiService{
   Future<Map<String, dynamic>?> registrationApiService(
      {required String fullname,
        required String phoneNumber,
        required String pincode,
        required String city,
        required String state,
        String visitingCard = ""}) async {
    // Print.p("in Login api ");
    try {

      var finalPath = "${ApiConstants.baseUrl}${ApiConstants.registrationEndPoint}";
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
      Response res = await BaseApiServices.dio.post(finalPath, data: data);
      return ResponseStructure.toResponseStructure(res);
      // await Future.delayed(Duration(seconds: 3),(){
      //   Print.p("After 3secound call back function");
      // });
    } catch (e) {
      // Print.p("Some thing went wrong in login");
      Print.p("in edit note Exception:${e.toString()}");
      customToast(msg: "Something went wrong regisration");
    }
  }

}