import 'dart:convert';

import 'package:dio/dio.dart';

class ResponseStructure {
  static Map<String, dynamic> toResponseStructure(Response r) {
    return jsonDecode(r.toString());
  }
}