import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../shared/widget/button/custom_button.dart';
import '../../../../../../watchlst/controller/watchlist_data_con.dart';

class LMEItemWidget extends StatelessWidget {
  final Map<String, dynamic> marketData;

  LMEItemWidget({required this.marketData});
  var con = Get.find<WatchlistDataController>();

  final Map<String, String> metalAbbr = {
    "LME Copper": "CU",
    "LME Aluminum": "AL",
    "LME Zinc": "ZN",
    "LME Nickel": "NI",
    "LME Lead": "PB",
    "LME Tin": "SN",
  };

  @override
  Widget build(BuildContext context) {
    bool isPriceNegative =
        marketData['risefall'] != null && marketData['risefall'].startsWith('-');

    String symbol = metalAbbr[marketData['name']] ?? marketData['name'] ?? 'N/A';

    return GestureDetector(
      onTap: () => _showDetailsBottomSheet(context, symbol, marketData, isPriceNegative),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.014,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Text(
                        symbol,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      Obx(() {
                        return GestureDetector(
                          onTap: () {
                            con.lmeWatchlistIds.value.contains(marketData["_id"].toString())
                                ? con.removeItem(marketData["_id"].toString())
                                : con.addItem(lmeIds: [marketData["_id"].toString()]);
                          },
                          child: con.lmeWatchlistIds.value.contains(marketData["_id"].toString())
                              ? Icon(Icons.bookmark, color: ColorConstants.primeryColor)
                              : Icon(Icons.bookmark_border_rounded),
                        );
                      }),
                    ],
                  ),
                ),
                Text(

                  marketData['latestPrice'].toString() ?? 'N/A',
                  textAlign: TextAlign.end,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    color: isPriceNegative ? Colors.red : Colors.green,
                  ),
                ),
                // SizedBox(width: 10),
                Expanded(
                  child: Text(
                    textAlign: TextAlign.right,
                    "${marketData['riseFall'] ?? 'N/A'} (${marketData['risefall'] ?? 'N/A'})",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
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
      BuildContext context, String symbol, Map<String, dynamic> data, bool isPriceNegative) {
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
                    data['name'],
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Divider(thickness: 1, height: 20),

              // Details Section
              _buildDetailRow("Last Price", data['latestPrice']),
              _buildDetailRow("High", data['highest'], Colors.green),
              _buildDetailRow("Low", data['lowest'], Colors.red),
              _buildDetailRow(
                "Change",
                "${data['riseFall'] ?? 'N/A'} (${data['risefall'] ?? 'N/A'})",
                isPriceNegative ? Colors.red : Colors.green,
              ),
              SizedBox(height: 24),

              // Timestamp
              Row(
                children: [
                  Icon(Icons.access_time, size: 14, color: Colors.grey),
                  SizedBox(width: 8),
                  Text(
                    "Last Trade: ${formatDateTime(DateTime.parse(data["updateTime"]))}",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24),

              // Close Button
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
