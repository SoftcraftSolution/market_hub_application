import 'package:dio/dio.dart';
import 'package:market_hub_application/core/api/api_services.dart';

import '../../../../core/constants/api_constant.dart';
import '../../../../core/models/response_structure.dart';
import '../../../../core/utils/utils.dart';

class SetPinApiService{

  Future<Map<String, dynamic>?> setPinApiService(
      {required String pin,
        required String email,
      }) async {
    // Print.p("in Login api ");
    try {

      var finalPath = "${ApiConstants.baseUrl}${ApiConstants.updatePinEndPoint}";
      var data = {
        "email":email,
        "newPin":pin

      };


      // data= FormData.fromMap(data);
      Response res = await BaseApiServices.dio.post(finalPath, data: data);
      return ResponseStructure.toResponseStructure(res);
      // await Future.delayed(Duration(seconds: 3),(){
      //   Print.p("After 3secound call back function");
      // });
    } catch (e) {
      // Print.p("Some thing went wrong in login");
      Print.p("in update pin  Exception:${e.toString()}");
      customToast(msg: "Something went wrong setPin controlleer");
    }
  }
}