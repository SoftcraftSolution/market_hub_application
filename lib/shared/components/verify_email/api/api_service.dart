


import 'package:dio/dio.dart';

import '../../../../core/api/api_services.dart';
import '../../../../core/constants/api_constant.dart';
import '../../../../core/models/response_structure.dart';
import '../../../../core/utils/utils.dart';

class VerifyEmailApiService{
  Future<Map<String, dynamic>?> verifyEmailApiService(
      {
        required String email,
        required bool verifyUser
      }) async {
    // Print.p("in Login api ");
    try {

      var finalPath = "${ApiConstants.baseUrl}${ApiConstants.verifyEmailEndPoint}";
      var data ={
        "email":email,
        "verifyUser":verifyUser
      };


      // data= FormData.fromMap(data);
      Response res = await BaseApiServices.dio.post(finalPath, data: data);
      return ResponseStructure.toResponseStructure(res);
      // await Future.delayed(Duration(seconds: 3),(){
      //   Print.p("After 3secound call back function");
      // });
    } catch (e) {
      // Print.p("Some thing went wrong in login");
      Print.p("in verify email Exception:${e.toString()}");
      customToast(msg: "Something went wrong verify email");
    }
  }
}