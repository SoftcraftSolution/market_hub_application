import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:market_hub_application/core/api/api_services.dart';
import 'package:market_hub_application/core/utils/user_utils.dart';
import 'package:market_hub_application/shared/components/success_page.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'splash_screen.dart';
bool isApproved=false;
bool isInProcess=false;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  var userData=await getLocalUserDetail();
 if (userData!=null){
   isInProcess=true;
   isApproved=userData["registration"]["isApproved"];
 }
  runApp(const MyApp());

}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
      //
      home: SplashScreen(),
    );
  }
}




