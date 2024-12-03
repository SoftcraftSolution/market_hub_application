import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/core/utils/utils.dart';
import '../../../../../../../shared/widget/button/custom_button.dart';
import '../../../../watchlst/controller/watchlist_data_con.dart';
import '../model/shfe_model.dart';


class SHFECard extends StatelessWidget {
  final SHFE_model marketData;

  SHFECard({Key? key,required this.marketData});

  final con = Get.find<WatchlistDataController>();

  @override
  Widget build(BuildContext context) {
    bool isPriceNegative = marketData.riseFall.toString().startsWith('-');

    return GestureDetector(
      onTap: () => _showDetailsBottomSheet(context, marketData, isPriceNegative),
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
                  child: Row(
                    children: [
                      Text(
                        marketData.name.toString().split(" ")[0].toString(),
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      Icon(
                        isPriceNegative ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                        color: isPriceNegative ? Colors.red : Colors.green,
                        size: MediaQuery.of(context).size.width * 0.06,
                      ),
                      Obx(() {
                        return GestureDetector(
                          onTap: () {
                            con.shfeWatchlistIds.value.contains(marketData.id.toString())
                                ? con.removeItem(marketData.id.toString())
                                : con.addItem(shfeIds: [marketData.id.toString()]);
                          },
                          child: con.shfeWatchlistIds.value.contains(marketData.id.toString())
                              ? Icon(Icons.bookmark, color: ColorConstants.primeryColor)
                              : Icon(Icons.bookmark_border_rounded),
                        );
                      }),
                    ],
                  ),
                ),
                Expanded(
                  child: Text(
                    marketData.latestPrice.toString(),
                    textAlign: TextAlign.end,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: isPriceNegative ? Colors.red : Colors.green,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Center(
                  child: Text(
                    "(${marketData.riseFall})",
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
      BuildContext context, SHFE_model data, bool isPriceNegative) {
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
                    data.name.toString().split(" ")[0].toString(),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Divider(thickness: 1, height: 20),

              // Details Section
              _buildDetailRow("Last Price", data.latestPrice),
              // _buildDetailRow("Open", data.),
              _buildDetailRow("High", data.highest, Colors.green),
              _buildDetailRow("Low", data.lowest, Colors.red),
              // _buildDetailRow("Volume", data.),
              _buildDetailRow(
                "Change",
                "${data.riseFall} (chg)",
                isPriceNegative ? Colors.red : Colors.green,
              ),
              SizedBox(height: 24),

              // Timestamp
              Row(
                children: [
                  Icon(Icons.access_time, size: 14, color: Colors.grey),
                  SizedBox(width: 8),
                  Text(
                    "Last Trade: ${formatDateTime(DateTime.parse(data.updateTime))}",
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
