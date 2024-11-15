
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../watchlst/controller/watchlist_data_con.dart';

class LMEItemWidget extends StatelessWidget {
  final Map<String, dynamic> marketData;
  bool isPriceNegative = false;
  Map<String, String> metalAbbr = {
    "LME Copper": "CU",
    "LME Aluminum": "AL",
    "LME Zinc": "ZN",
    "LME Nickel": "NI",
    "LME Lead": "PB",
    "LME Tin": "SN",
  };
  var con = Get.find<WatchlistDataController>();

  LMEItemWidget({required this.marketData});

  @override
  Widget build(BuildContext context) {
    isPriceNegative = marketData['risefall'] != null &&
        marketData['risefall'].startsWith('-');
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.02,
      ),
      child: Column(
        children: [
          _buildMarketDataSection(context),
          Divider(),
        ],
      ),
    );
  }

  Widget _buildMarketDataSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.01,
        horizontal: MediaQuery.of(context).size.width * 0.03,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildSymbolSection(context),
          _buildPriceSection(context),
          _buildHighLowSection(context),
        ],
      ),
    );
  }

  Widget _buildSymbolSection(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width * 0.045;

    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                marketData['name'].toString().length == 2
                    ? marketData['name']
                    : metalAbbr[marketData['name']].toString(),
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              isPriceNegative
                  ? Icon(Icons.arrow_drop_down, color: Colors.red, size: 30)
                  : Icon(Icons.arrow_drop_up, color: Colors.green, size: 30),
              Obx(
                    () {
                  // Print.p("lme item" + marketData.toString());
                  return GestureDetector(
                    onTap: () {
                      con.lmeWatchlistIds.value.contains(
                          marketData["_id"].toString())
                          ? con.removeItem(marketData["_id"].toString())
                          : con.addItem(lmeIds: [marketData["_id"].toString()]);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.02,
                      ),
                      child: con.lmeWatchlistIds.value
                          .contains(marketData["_id"].toString())
                          ? Icon(
                        Icons.bookmark,
                        color: ColorConstants.primeryColor,
                      )
                          : Icon(Icons.bookmark_border_rounded),
                    ),
                  );
                },
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.access_time, size: 14, color: Colors.grey),
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              Text(
                "${DateTime.now().toString().split(' ')[1].split(".")[0]}",
                style: GoogleFonts.poppins(
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPriceSection(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            marketData['latestPrice'] ?? '',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * 0.05,
              color: isPriceNegative ? Colors.red : Colors.green,
            ),
          ),
          Text(
            "${marketData['riseFall'] ?? ''} (${marketData['risefall'] ?? ''})",
            style: GoogleFonts.poppins(
              fontSize: MediaQuery.of(context).size.width * 0.035,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHighLowSection(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${marketData['highest'] ?? ''} (High)",
            style: GoogleFonts.poppins(
              fontSize: MediaQuery.of(context).size.width * 0.035,
              color: Colors.green,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Text(
            "${marketData['lowest'] ?? ''} (Low)",
            style: GoogleFonts.poppins(
              fontSize: MediaQuery.of(context).size.width * 0.035,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
