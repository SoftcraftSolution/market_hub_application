import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/features/future/pages/FX_page/widget/fx_card.dart';
import 'package:market_hub_application/features/future/pages/SHFE_page/widget/shfe_card.dart';
import 'package:market_hub_application/features/spot_price/widget/sport_card.dart';
import 'package:market_hub_application/features/watchlst/page/empty_watchlist/empty_watchlist.dart';
import 'package:market_hub_application/features/watchlst/controller/watchlist_data_con.dart';

import '../../../../future/pages/LME_Page/pages/LME_Future/component/lme_item_widget.dart';
import '../../../../future/pages/MCX_Page/component/mcx_item_widget.dart';
import '../../../../future/pages/US_page/widget/usItemWidget.dart';

class FutureWatchlistPage extends StatefulWidget {
  @override
  _FutureWatchlistPageState createState() => _FutureWatchlistPageState();
}

class _FutureWatchlistPageState extends State<FutureWatchlistPage> {
  final WatchlistDataController con = Get.find<WatchlistDataController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      body: Obx(() {
        // Check if all specified watchlists are empty
        if (con.lmeWatchList.value.isEmpty &&
            con.fxWatchList.value.isEmpty &&
            con.mcxWatchList.value.isEmpty &&
            con.shfeWatchList.value.isEmpty) {
          return EmptyWatchlist(); // Show empty state if all specified watchlists are empty
        }

        return ListView(
          children: [
            _buildWatchlistCategory("London(LME)", con.lmeWatchList.value, (item)=>LMEItemWidget(marketData: item,)),
            _buildWatchlistCategory("Currency(FX)", con.fxWatchList.value, (item) => FXCard(key: ValueKey(item.id), fxData: item)),
            _buildWatchlistCategory("India(MCX)", con.mcxWatchList.value, (item)=>MCXItemWidget(marketData: item,)),
            _buildWatchlistCategory("United Nation(US)", con.usWatchList.value, (item)=>USItemWidget(marketData: item,)),
            _buildWatchlistCategory("China(SHFE)", con.shfeWatchList.value, (item) => SHFECard(key: ValueKey(item.id), marketData: item)),
          ],
        );
      }),
    );
  }

  // A method to create each watchlist category with an ExpansionTile
  Widget _buildWatchlistCategory(
      String title,
      List<dynamic> items,
      Widget Function(dynamic item) itemBuilder,
      ) {
    return items.isEmpty?SizedBox():ExpansionTile(

      collapsedBackgroundColor: ColorConstants.greyColor.withOpacity(0.05),
      key: ValueKey(title),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: items.map((item) {
        return itemBuilder(item);
      }).toList(),
    );
  }


}
