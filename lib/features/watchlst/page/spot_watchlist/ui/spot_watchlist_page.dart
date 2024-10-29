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

            return ExpansionTile(
              key: ValueKey(key),
              title:
                  Row(children: [
                    Text("${key['category']} ${key['type']}",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                    Text("(${key['subcategory']})",
                        style: GoogleFonts.poppins(
                          color: ColorConstants.primeryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                    )
                  ],),
              // Text(
              //   '${key['category']} - ${key['type']} - ${key['subcategory']}',
              //   style: GoogleFonts.poppins(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              children: items.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SpotItemCard(key: ValueKey(item.id), item: item),
                );
              }).toList(),
            );
          },
        );
      }),
    );
  }
}
