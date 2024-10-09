import 'package:dio/dio.dart';
import 'package:market_hub_application/core/utils/utils.dart';

import '../api/dialog_services.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async{
    if (err.type == DioExceptionType.connectionError) {
      // Handle connection error globally
      // Print.p("in custm interceptior");
      DialogService.showNoInternetDialog();

    }
    // Pass the error to the next handler
    handler.next(err);
  }
}
