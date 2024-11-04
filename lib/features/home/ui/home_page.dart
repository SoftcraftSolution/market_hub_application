import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';

import 'package:market_hub_application/core/theme/theme.dart';
import 'package:market_hub_application/core/utils/userDataCon.dart';
import 'package:market_hub_application/features/home/widgets/home_update_list.dart';

import '../../user/profile/ui/profile_screen.dart';
import '../../watchlst/page/spot_watchlist/controller/spot_watchlist_con.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
   var userDetailCon=UserDataController.userDetail;
  @override
  Widget build(BuildContext context) {
    // for intialization only
    Get.put(SpotWatchlistController());

    return SafeArea(
      child: Scaffold(backgroundColor: ColorConstants.backgroundColor,body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(child: Row(
              children: [
                Image.asset("assets/splash_screeen_img/logo.png",height: 70,width: 70,),
                Expanded(child: Text(" Hello ${userDetailCon!.name} 👋",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w700,),)),
                GestureDetector(
                    onTap: (){
                      Get.to(ProfileScreen());
                    },
                    child: CircleAvatar(backgroundImage: AssetImage('assets/splash_screeen_img/defult_profile.png'),backgroundColor: Colors.grey.shade200,radius: 25,))
              ],
            ),),
            Text("Your market updates will be displayed here.",style: GoogleFonts.poppins(
                fontSize: 17, color: Color(0xff646464)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Divider(color: Colors.grey,),
            ),
            Expanded(child: HomeUpdatePage())
          ],
        ),
      ),),
    );
  }
}
