import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/features/spot_price/widget/sport_card.dart';
import 'package:market_hub_application/features/watchlst/controller/watchlist_con.dart';
import 'package:market_hub_application/features/watchlst/ui/empty_watchlist.dart';
import 'package:market_hub_application/shared/components/loading_page/ui/loading_page.dart';

import '../../spot_price/model/item_model.dart';

class WatchlistPage extends StatefulWidget {
  @override
  _WatchlistPageState createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  // Initialize WatchlistController
  final WatchlistController con = Get.put(WatchlistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.backgroundColor,
        title: Text(
          'WatchList',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(() {
          // Display loading state if the watchlist is empty
          // if (con.watchlist.isEmpty && con.isLoading.value) {
          //   return LoadingPage();
          // }
          if (con.watchlist.isEmpty) {
            return EmptyWatchlist();
          }

          return ReorderableListView(
            padding: EdgeInsets.symmetric(vertical: 8),
            children: [
              for (final item in con.watchlist)
              // Use ValueKey for unique identification in ReorderableListView
                SpotItemCard(key: ValueKey(item.id), item: item),
            ],
            onReorder: (int oldIndex, int newIndex) {
              setState(() {
                if (newIndex > oldIndex) newIndex -= 1;
                final SpotItem item = con.watchlist.removeAt(oldIndex);
                con.watchlist.insert(newIndex, item);
              });
            },
          );
        }),
      ),
    );
  }
}
