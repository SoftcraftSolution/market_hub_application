import 'package:dio/dio.dart';
import 'package:market_hub_application/core/utils/utils.dart';

import '../../shared/widget/dialogs/error_dialog.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async{
    if (err.type == DioExceptionType.connectionError) {
      // Handle connection error globally
      // Print.p("in custm interceptior");
      ErrorDialog.showNoInternetDialog();

    }
    // Pass the error to the next handler
    handler.next(err);
  }
}
