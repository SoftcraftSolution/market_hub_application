import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/features/future/pages/SHFE_page/model/shfe_model.dart';

import '../../../../../core/constants/color_constant.dart';
import '../../../../watchlst/controller/watchlist_data_con.dart';

class SHFECard extends StatelessWidget {
  final SHFE_model marketData;

   SHFECard({Key? key, required this.marketData}) : super(key: key);
  var con = Get.find<WatchlistDataController>();
  @override
  Widget build(BuildContext context) {
    bool isPriceNegative = marketData.change.startsWith('-');

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
            Divider(color: Colors.grey.shade300),
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
              Text(
                marketData.description,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
              Icon(
                isPriceNegative ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                color: isPriceNegative ? Colors.red : Colors.green,
                size: MediaQuery.of(context).size.width * 0.07, // Responsive icon size
              ),
              // Obx(
              //       () {
              //     // Print.p("lme item" + marketData.toString());
              //     return GestureDetector(
              //       onTap: () {
              //         con.shfeWatchlistIds.value.contains(
              //             marketData.id.toString())
              //             ? con.removeItem(marketData.id.toString())
              //             : con.addItem(shfeIds: [marketData.id.toString()]);
              //       },
              //       child: Padding(
              //         padding: EdgeInsets.symmetric(
              //           horizontal: MediaQuery.of(context).size.width * 0.02,
              //         ),
              //         child: con.shfeWatchlistIds.value
              //             .contains(marketData.id.toString())
              //             ? Icon(
              //           Icons.bookmark,
              //           color: ColorConstants.primeryColor,
              //         )
              //             : Icon(Icons.bookmark_border_rounded),
              //       ),
              //     );
              //   },
              // )
            ],
          ),
        ),
        Expanded(
          child: Text(
            textAlign: TextAlign.center,
            marketData.price,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: fontSize * 0.9,
              color: isPriceNegative ? Colors.red : Colors.green,
            ),
          ),
        ),
        _buildDetail(context, "${marketData.high} (High)", Colors.green),
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
                "${DateTime.now().toLocal().toString().split(' ')[1].split('.')[0]}",
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
          "${marketData.change} (chg)",
          isPriceNegative ? Colors.red : Colors.green,
        ),
        _buildDetail(
          context,
          "${marketData.low} (Low)",
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
