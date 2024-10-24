import 'package:dio/dio.dart';
import 'package:market_hub_application/core/api/api_services.dart';
import 'package:market_hub_application/core/constants/api_constant.dart';

import '../../../../core/models/response_structure.dart';
import '../../../../core/models/userdetail.dart';
import '../../../../core/utils/utils.dart';

class RegistrationApiService{
   Future<Map<String, dynamic>?> registrationApiService(
      {required UserDetail user }) async {
    // Print.p("in Login api ");
    try {

      var finalPath = "https://markethub-app-backend.onrender.com${ApiConstants.registrationEndPoint}";
      FormData data =FormData.fromMap({
        "fullName": user.name,
        "email":user.email,
        "whatsappNumber":user.whatsappNumber,
        "phoneNumber": user.phoneNumber,
        "pincode": user.pincode,
        "visitingCard":await MultipartFile.fromFile(user.visitingCard),
        "pin":user.pin,
        "planName":user.plan

      });


      // data= FormData.fromMap(data);
      Response res = await BaseApiServices.dio.post(finalPath, data: data);
      return ResponseStructure.toResponseStructure(res);
      // await Future.delayed(Duration(seconds: 3),(){
      //   Print.p("After 3secound call back function");
      // });
    } catch (e) {
      // Print.p("Some thing went wrong in login");
      Print.p("in registration Exception:${e.toString()}");
      customToast(msg: "Something went wrong registration");
    }
  }

}