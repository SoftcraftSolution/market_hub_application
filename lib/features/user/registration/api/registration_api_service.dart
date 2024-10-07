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
        required String email,
        required String whatsappNumber,
        required String pin,
        required String planName,

        required String visitingCard }) async {
    // Print.p("in Login api ");
    try {

      var finalPath = "${ApiConstants.baseUrl}${ApiConstants.registrationEndPoint}";
      FormData data =FormData.fromMap({
        "fullName": fullname,
        "email":email,
        "whatsappNumber":whatsappNumber,
        "phoneNumber": phoneNumber,
        "pincode": pincode,
        "visitingCard":MultipartFile.fromFile(visitingCard),
        "pin":pin,
        "planName":planName

      });


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