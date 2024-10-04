import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:market_hub_application/core/api/api_services.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  BaseApiServices.dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
  )
  );
  await Hive.initFlutter();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}




