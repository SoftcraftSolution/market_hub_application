import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';

import 'package:market_hub_application/core/theme/theme.dart';
import 'package:market_hub_application/core/utils/utiliity.dart';
import 'package:market_hub_application/features/alert/ui/alert_page.dart';
import 'package:market_hub_application/features/future/ui/future_page.dart';
import 'package:market_hub_application/features/home/ui/home_page.dart';
import 'package:market_hub_application/features/spot_price/ui/spot_price.dart';
import 'package:market_hub_application/features/watchlst/ui/watchlist_page.dart';


import '../controller/navigation_controller.dart';

class Home extends StatelessWidget {
   Home({super.key});
  var homeCon=Get.put(HomeCon());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: Obx(
            () => Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey, // Set your desired border color
                width: 1.0, // Set the desired width
              ),
            ),
          ),
          child: NavigationBar(
            height: 90,
            elevation: 0.8,
            backgroundColor: Colors.grey.withOpacity(0.08),
            onDestinationSelected: (int index) {
              homeCon.setPageIndex(index);
              Print.p("index=$index");
            },
            indicatorColor: Colors.transparent,
            selectedIndex: homeCon.pageIndex.value,
            destinations: <Widget>[
              NavigationDestination(
                selectedIcon:SvgPicture.asset("assets/icon/s-home.svg",height: 26,) ,
                icon: SvgPicture.asset("assets/icon/home.svg",height: 26,),
              label: 'Home',
              ),
              NavigationDestination(
                selectedIcon:SvgPicture.asset("assets/icon/s-future.svg",height: 26,) ,
                icon: SvgPicture.asset("assets/icon/future.svg",height: 26,),
                label: 'Future',
              ),
              NavigationDestination(
                selectedIcon:SvgPicture.asset("assets/icon/s-spot.svg",height: 26,) ,
                icon: SvgPicture.asset("assets/icon/spot.svg",height: 26,),
                label: 'Spot Price',
              ),
              NavigationDestination(
                selectedIcon:SvgPicture.asset("assets/icon/s-alert.svg",height: 26,) ,
                icon: SvgPicture.asset("assets/icon/alert.svg",height: 26,),
                label: 'Alert',
              ),
              NavigationDestination(
                selectedIcon:SvgPicture.asset("assets/icon/s-watch.svg",height: 26,) ,
                icon: SvgPicture.asset("assets/icon/watch.svg",height: 26,),
                label: 'Watchlist',
              ),
            ],
          ),
        ),
      )


        ,
          backgroundColor: ColorConstants.backgroundColor,

      body:Obx(
          ()=>homeCon.pageIndex.value==0?HomePage():homeCon.pageIndex.value==1?FuturePage():homeCon.pageIndex.value==2?SpotPricePage():homeCon.pageIndex.value==3?AlertPage():WatchlistPage()

      ) );
  }
}
