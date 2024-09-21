import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/screens/home/home_con.dart';
import 'package:market_hub_application/screens/main_screen/alert_page.dart';
import 'package:market_hub_application/screens/main_screen/future_page.dart';
import 'package:market_hub_application/screens/main_screen/home_page.dart';
import 'package:market_hub_application/screens/main_screen/spot_price.dart';
import 'package:market_hub_application/screens/main_screen/watchlist_page.dart';
import 'package:market_hub_application/utility/theme.dart';
import 'package:market_hub_application/utility/utiliity.dart';

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
            height: 100,
            elevation: 0.8,
            backgroundColor: Colors.transparent,
            onDestinationSelected: (int index) {
              homeCon.setPageIndex(index);
              Print.p("index=$index");
            },
            indicatorColor: Colors.transparent,
            selectedIndex: homeCon.pageIndex.value,
            destinations: <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.home, size: 34, color: homeCon.pageIndex.value == 0 ? Color(0xFF1918BC) : Colors.grey),
                icon: Icon(Icons.home_outlined, color: homeCon.pageIndex.value == 0 ? Color(0xFF1918BC) : Colors.grey),
                label: 'Home',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.auto_graph, size: 34, color: homeCon.pageIndex.value == 1 ? Color(0xFF1918BC) : Colors.grey),
                icon: Icon(Icons.auto_graph, color: homeCon.pageIndex.value == 1 ? Color(0xFF1918BC) : Colors.grey),
                label: 'Future',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.label, size: 34, color: homeCon.pageIndex.value == 2 ? Color(0xFF1918BC) : Colors.grey),
                icon: Transform.rotate(
                  child: Icon(Icons.label, color: homeCon.pageIndex.value == 2 ? Color(0xFF1918BC) : Colors.grey),
                  angle: 2.0,
                ),
                label: 'Spot Price',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.notifications, size: 34, color: homeCon.pageIndex.value == 3 ? Color(0xFF1918BC) : Colors.grey),
                icon: Icon(Icons.notifications, color: homeCon.pageIndex.value == 3 ? Color(0xFF1918BC) : Colors.grey),
                label: 'Alert',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.bookmark_sharp, size: 34, color: homeCon.pageIndex.value == 4 ? Color(0xFF1918BC) : Colors.grey),
                icon: Icon(Icons.bookmark_sharp, color: homeCon.pageIndex.value == 4 ? Color(0xFF1918BC) : Colors.grey),
                label: 'Watchlist',
              ),
            ],
          ),
        ),
      )


        ,
          backgroundColor: AppTheme.backgroundColor,

      body:Obx(
          ()=>homeCon.pageIndex.value==0?HomePage():homeCon.pageIndex.value==1?FuturePage():homeCon.pageIndex.value==2?SpotPricePage():homeCon.pageIndex.value==3?AlertPage():WatchlistPage()

      ) );
  }
}
