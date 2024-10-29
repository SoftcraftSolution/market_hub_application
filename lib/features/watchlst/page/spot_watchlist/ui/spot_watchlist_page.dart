import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/features/spot_price/widget/sport_card.dart';
import 'package:market_hub_application/features/watchlst/page/spot_watchlist/controller/spot_watchlist_con.dart';
import 'package:market_hub_application/features/watchlst/page/empty_watchlist/empty_watchlist.dart';
import 'package:market_hub_application/shared/components/loading_page/ui/loading_page.dart';

import '../../../../spot_price/model/item_model.dart';

class SpotWatchlistPage extends StatefulWidget {
  @override
  _SpotWatchlistPageState createState() => _SpotWatchlistPageState();
}

class _SpotWatchlistPageState extends State<SpotWatchlistPage> {
  // Initialize WatchlistController
  final SpotWatchlistController con = Get.put(SpotWatchlistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,

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
