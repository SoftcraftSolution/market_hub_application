import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/features/watchlst/controller/watchlist_con.dart';
import 'package:market_hub_application/features/watchlst/page/spot_watchlist/ui/spot_watchlist_page.dart';
import 'package:market_hub_application/shared/components/test_screen.dart';

import '../../../shared/widget/optionBar/list_option_without_border.dart';

class WatchlistPage extends StatelessWidget {
   WatchlistPage({super.key});
var con=Get.put(WatchlistCon());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      body:
      SafeArea(
        child: Obx(
          ()=> Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListOptionWithoutBorder(elements: ["Future","Spot Price"],onIndexChanged: WatchlistPageIndexChange().onIndexChange,controller: con,),
            ),
            Expanded(child: con.pageIndex.value==0?TestScreen("Future Watchlist"):SpotWatchlistPage()),
          ],),
        ),
      )
      ,);
  }
}
