import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/constants/color_constant.dart';
import '../../../../../shared/widget/button/custom_button.dart';
import '../../../../watchlst/controller/watchlist_data_con.dart';

class MCXItemWidget extends StatelessWidget {
  final Map<String, dynamic> marketData;

  MCXItemWidget({required this.marketData});
  var con = Get.find<WatchlistDataController>();

  final Map<String, String> symbolMapping = {
    "MCX Gold": "AU",
    "MCX Silver": "AG",
    "MCX Copper": "CU",
    "MCX Zinc": "ZN",
    "MCX Lead": "PB",
    "MCX Aluminium": "AL",
    "MCX Natural Gas": "NG",
    "MCX Crude Oil": "CO",
    "MCX Zinc Mini": "ZN Mini",
    "MCX Aluminium Mini": "AL Mini",
    "MCX Lead Mini": "PB Mini",
    "MCX Silver Mini": "AG Mini",
    "MCX Silver Micro": "AG Micro",
    "MCX Gold Mini": "AU Mini",
    "MCX Mentha Oil": "MO",
  };

  @override
  Widget build(BuildContext context) {
    bool isPriceNegative =
        marketData['Change'] != null && marketData['Change'].startsWith('-');

    String symbol = symbolMapping[marketData['Symbol']] ?? marketData['Symbol'] ?? 'N/A';

    return GestureDetector(
      onTap: () => _showDetailsBottomSheet(context, isPriceNegative, symbol),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04,
              vertical: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: Text(
                          symbol,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      Obx(() {
                        return GestureDetector(
                          onTap: () {
                            con.mcxWatchlistIds.value
                                .contains(marketData["_id"].toString())
                                ? con.removeItem(marketData["_id"].toString())
                                : con.addItem(
                                mcxIds: [marketData["_id"].toString()]);
                          },
                          child: con.mcxWatchlistIds.value
                              .contains(marketData["_id"].toString())
                              ? Icon(
                            Icons.bookmark,
                            color: ColorConstants.primeryColor,
                          )
                              : Icon(Icons.bookmark_border_rounded),
                        );
                      }),
                    ],
                  ),
                ),
                Expanded(
                  child: Text(
                    marketData['Last'] ?? 'N/A',
                    textAlign: TextAlign.end,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: isPriceNegative ? Colors.red : Colors.green,
                    ),
                  ),
                ),
                SizedBox(width: 14),
                Text(
                  "(${marketData['ChangePercent'] ?? 'N/A'})",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  void _showDetailsBottomSheet(
      BuildContext context, bool isPriceNegative, String symbol) {
    showModalBottomSheet(
      backgroundColor: ColorConstants.backgroundColor,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Section
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    marketData['Symbol'].toString().replaceAll("MCX",""),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Divider(thickness: 1, height: 20),

              // Details Section
              _buildDetailRow("Last Price", marketData['Last']),
              _buildDetailRow("High", marketData['High'], Colors.green),
              _buildDetailRow("Low", marketData['Low'], Colors.red),
              _buildDetailRow(
                "Change",
                "${marketData['Change'] ?? 'N/A'} (${marketData['ChangePercent'] ?? 'N/A'})",
                isPriceNegative ? Colors.red : Colors.green,
              ),
              _buildDetailRow("Close", marketData['Close'], Colors.black),

              SizedBox(height: 24),

              // Timestamp
              Row(
                children: [
                  Icon(Icons.access_time, size: 14, color: Colors.grey),
                  SizedBox(width: 8),
                  Text(
                    "Updated at: ${DateTime.now().toString().split(' ')[1].split('.')[0]}",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24),

              // CustomButton for Closing
              Center(
                child: CustomButton(
                  title: "Close",
                  onPress: () async {
                    Navigator.pop(context); // Close the bottom sheet
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(String label, dynamic value, [Color? color]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          Text(
            value?.toString() ?? 'N/A',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: color ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
