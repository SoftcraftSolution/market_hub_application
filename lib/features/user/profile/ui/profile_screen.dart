import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/core/theme/theme.dart';
import 'package:market_hub_application/features/user/profile/component/profile_top_container.dart';
import 'package:market_hub_application/features/user/profile/controller/profileController.dart';
import 'package:market_hub_application/shared/widget/button/custom_button.dart';

import '../component/profile_tiles.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
            ),
            ProfileTopContainer(),
            SizedBox(height: 20,),
            CustomButton(title: "Upgrade Plan", onPress: ProfilController().onUpgradePlan,height: 54,),
            SizedBox(height: 20,),
            Expanded(child:Column(
              children: [
                ProfileElements(leading: Center(child: Image.asset("assets/splash_screeen_img/logo.png")),title: "About Us",onTap: (){},),
                ProfileElements(leading: Icon(Icons.call_outlined,size: 30,color: ColorConstants.primeryColor,),title: "Contact Us",onTap: (){}),
                ProfileElements(leading: Icon(Icons.account_balance_outlined,size: 30,color: ColorConstants.primeryColor,),title: "Terms & Conditions",onTap: (){}),
                ProfileElements(leading: Icon(Icons.feedback_outlined,size: 30,color: ColorConstants.primeryColor,),title: "Feedback",onTap: (){}),
                ProfileElements(leading: Icon(Icons.exit_to_app_rounded,size: 30,color: ColorConstants.primeryColor,),title: "Log Out",isLast: true,onTap: ProfilController().onLogOut,),
              ],
            ))
          ],
        ),
      ),
    );
  }


}

