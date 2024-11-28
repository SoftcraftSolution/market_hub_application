import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/color_constant.dart';
import '../../../../watchlst/controller/watchlist_data_con.dart';

class USItemWidget extends StatelessWidget {
  final Map<String, dynamic> marketData;

  USItemWidget({required this.marketData});
  var con = Get.find<WatchlistDataController>();

  @override
  Widget build(BuildContext context) {
    bool isPriceNegative = marketData['Change'].startsWith('-');

    // Use MediaQuery to get screen width
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenWidth * 0.01, // Dynamic padding
          horizontal: screenWidth * 0.05, // Dynamic padding
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSymbolSection(isPriceNegative, screenWidth),
            const SizedBox(height: 10),
            _buildPriceSection(isPriceNegative, screenWidth),
            const SizedBox(height: 10),
            Divider(),
          ],
        ),
      ),
    );
  }

  Widget _buildSymbolSection(bool isPriceNegative, double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                child: Text(
                  (marketData['Symbol'] ?? 'N/A').toString().replaceAll("US", "").trim(),
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.035, // Responsive font size
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 5),
              Icon(
                isPriceNegative ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                color: isPriceNegative ? Colors.red : Colors.green,
                size: screenWidth * 0.07, // Responsive icon size
              ),
              Obx(
                    () {
                  return GestureDetector(
                    onTap: () {
                      con.mcxWatchlistIds.value.contains(marketData["_id"].toString())
                          ? con.removeItem(marketData["_id"].toString())
                          : con.addItem(mcxIds: [marketData["_id"].toString()]);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.02,
                      ),
                      child: con.mcxWatchlistIds.value.contains(marketData["_id"].toString())
                          ? Icon(
                        Icons.bookmark,
                        color: ColorConstants.primeryColor,
                        size: screenWidth * 0.06, // Responsive icon size
                      )
                          : Icon(
                        Icons.bookmark_border_rounded,
                        size: screenWidth * 0.06, // Responsive icon size
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: Text(
            textAlign: TextAlign.end,
            marketData['Last'] ?? 'N/A',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.04, // Responsive font size
              color: isPriceNegative ? Colors.red : Colors.green,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceSection(bool isPriceNegative, double screenWidth) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(Icons.access_time, size: screenWidth * 0.035, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                "${DateTime.now().toString().split(' ')[1].split('.')[0]}",
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.035, // Responsive font size
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        _buildDetail(
          "${marketData['Change'] == "" ? 'N/A' : marketData['Change']} (${marketData['ChangePercent'] ?? 'N/A'})",
          isPriceNegative ? Colors.red : Colors.green,
          screenWidth,
        ),
      ],
    );
  }

  Widget _buildDetail(String text, Color color, double screenWidth) {
    return Expanded(
      child: Text(
        textAlign: TextAlign.end,
        text,
        style: GoogleFonts.poppins(
          fontSize: screenWidth * 0.035, // Responsive font size
          color: color,
        ),
      ),
    );
  }
}
