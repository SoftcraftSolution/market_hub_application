import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/color_constant.dart';
import '../../../../watchlst/controller/watchlist_data_con.dart';

class MCXItemWidget extends StatelessWidget {
  final Map<String, dynamic> marketData;

  MCXItemWidget({required this.marketData});
  var con = Get.find<WatchlistDataController>();

  @override
  Widget build(BuildContext context) {
    bool isPriceNegative = marketData['Change'] != null && marketData['Change'].startsWith('-');

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.grey.shade100,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01,
          horizontal: MediaQuery.of(context).size.width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSymbolSection(context, isPriceNegative),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            _buildPriceSection(context, isPriceNegative),
            Divider(),
          ],
        ),
      ),
    );
  }

  Widget _buildSymbolSection(BuildContext context, bool isPriceNegative) {
    double fontSize = MediaQuery.of(context).size.width * 0.045;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  (marketData['Symbol'] ?? 'N/A').toString().replaceAll("MCX", "").trim(),
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(
                isPriceNegative ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                color: isPriceNegative ? Colors.red : Colors.green,
                size: 26,
              ),
              Obx(
                    () {
                  // Print.p("lme item" + marketData.toString());
                  return GestureDetector(
                    onTap: () {
                      con.mcxWatchlistIds.value.contains(
                          marketData["_id"].toString())
                          ? con.removeItem(marketData["_id"].toString())
                          : con.addItem(mcxIds: [marketData["_id"].toString()]);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.02,
                      ),
                      child: con.mcxWatchlistIds.value
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
        ),
        Expanded(
          child: Text(
            textAlign: TextAlign.center,
            marketData['Last'] ?? 'N/A',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: fontSize * 0.9,
              color: isPriceNegative ? Colors.red : Colors.green,
            ),
          ),
        ),
        _buildDetail(
          context,
          "${marketData['High'] == "" ? 'N/A' : marketData['High']} (High)",
          Colors.green,
        ),
      ],
    );
  }

  Widget _buildPriceSection(BuildContext context, bool isPriceNegative) {
    double fontSize = MediaQuery.of(context).size.width * 0.035;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(Icons.access_time, size: fontSize, color: Colors.grey),
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              Text(
                "${DateTime.now().toString().split(' ')[1].split(".")[0]}",
                style: GoogleFonts.poppins(
                  fontSize: fontSize,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        _buildDetail(
          context,
          "${marketData['Change'] == "" ? 'N/A' : marketData['Change']} (${marketData['ChangePercent'] ?? 'N/A'})",
          isPriceNegative ? Colors.red : Colors.green,
        ),
        _buildDetail(
          context,
          "${marketData['Low'] == "" ? 'N/A' : marketData['Low']} (Low)",
          const Color(0xFFEF5B4F),
        ),
      ],
    );
  }

  Widget _buildDetail(BuildContext context, String text, Color color) {
    double fontSize = MediaQuery.of(context).size.width * 0.035;

    return Expanded(
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: GoogleFonts.poppins(
          fontSize: fontSize,
          color: color,
        ),
      ),
    );
  }
}
