import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/features/spot_price/widget/sport_card.dart';
import 'package:market_hub_application/features/watchlst/page/spot_watchlist/controller/spot_watchlist_con.dart';
import 'package:market_hub_application/features/watchlst/page/empty_watchlist/empty_watchlist.dart';

class SpotWatchlistPage extends StatefulWidget {
  @override
  _SpotWatchlistPageState createState() => _SpotWatchlistPageState();
}

class _SpotWatchlistPageState extends State<SpotWatchlistPage> {
  final SpotWatchlistController con = Get.put(SpotWatchlistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      body: Obx(() {
        if (con.watchlist.isEmpty) {
          return EmptyWatchlist(); // Show empty state if watchlist is empty
        }

        final groupedData = con.groupWatchlistByCategory();

        return ListView.builder(
          itemCount: groupedData.length,
          itemBuilder: (context, index) {
            final key = groupedData.keys.elementAt(index); // Group key
            final items = groupedData[key]!; // List of items for this group

            // Split the key to display it properly in the UI
            final keyParts = key.toString().split('-');
            final category = keyParts[0];
            final type = keyParts[1];
            final subcategory = keyParts[2];

            return ExpansionTile(
              key: ValueKey(key),
              title: Row(
                children: [
                  Text(
                    "$category $type",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "($subcategory)",
                    style: GoogleFonts.poppins(
                      color: ColorConstants.primeryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              children: items.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SpotItemCard(
                    key: ValueKey(item.id),
                    item: item,
                  ),
                );
              }).toList(),
            );
          },
        );
      }),
    );
  }
}
