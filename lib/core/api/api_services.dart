
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:market_hub_application/core/constants/api_constant.dart';
import 'package:market_hub_application/core/utils/custom_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../models/response_structure.dart';
import '../theme/theme.dart';
import '../utils/utils.dart';



class BaseApiServices {

  static var dio=Dio()..interceptors.addAll([PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
  ),]);



}
