import 'package:flutter/material.dart';
import 'package:market_hub_application/utility/theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.themeData["backgroundColor"],
      body: Center(child: Image.asset("assets/splash_screeen_img/logo.png",height: 270,),),
    );
  }
}
