import 'package:dio/dio.dart';

import '../../../../core/api/api_services.dart';
import '../../../../core/constants/api_constant.dart';
import '../../../../core/models/response_structure.dart';
import '../../../../core/utils/utils.dart';

class AdminApprovalAPiService{
  Future<Map<String, dynamic>?> checkUserApprovalApiService(
      {required String email }) async {
    // Print.p("in Login api ");
    try {

      var finalPath = "${ApiConstants.baseUrl}${ApiConstants.checkApprovalEndPoint}";
      var data ={
        "email":email,
      };


      // data= FormData.fromMap(data);
      Response res = await BaseApiServices.dio.post(finalPath, data: data);
      return ResponseStructure.toResponseStructure(res);
      // await Future.delayed(Duration(seconds: 3),(){
      //   Print.p("After 3secound call back function");
      // });
    } catch (e) {
      // Print.p("Some thing went wrong in login");
      Print.p("in check user Approval Exception:${e.toString()}");
      customToast(msg: "Something went wrong check user Approval");
    }
  }
}