import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';

import '../../../../../../../core/utils/utils.dart';
import '../../../../../../watchlst/page/spot_watchlist/controller/spot_watchlist_con.dart';

class LMEItemWidget extends StatelessWidget {
  final Map<String, dynamic> marketData;
  bool isPriceNegative=false;
  Map<String, String> metalAbbr = {
    "LME Copper": "CU",
    "LME Aluminum": "AL",
    "LME Zinc": "ZN",
    "LME Nickel": "NI",
    "LME Lead": "PB",
    "LME Tin": "SN",
  };
  var con=Get.find<SpotWatchlistController>();

  LMEItemWidget({required this.marketData,});

  @override
  Widget build(BuildContext context) {
    isPriceNegative=marketData['risefall'] != null && marketData['risefall'].startsWith('-');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 100,
        child: Column(
          children: [
            _buildMarketDataSection(context),
            Divider()
          ],
        ),
      ),
    );
  }
  

  Widget _buildMarketDataSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildSymbolSection(context),
          _buildPriceSection(context),
          _buildhighlow(context),


        ],
      ),
    );
  }

  Widget _buildSymbolSection(BuildContext context) {

    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
      marketData['name'].toString().length==2? marketData['name']:
      metalAbbr[marketData['name']].toString(),
                // ( marketData['name'] ?? '').toString(),
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              // SizedBox(width: 4),
              isPriceNegative?Icon(Icons.arrow_drop_down, color: Colors.red,size: 30,):Icon(Icons.arrow_drop_up, color: Colors.green,size: 30),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 5),
              //   child: Icon(Icons.bookmark_border_rounded,),
              // ),
              Obx(
                    () {
                      Print.p("lme item"+marketData.toString());
                     return  GestureDetector(
                        onTap: () {
                          con.lmeWatchlistIds.value.contains(
                              marketData["_id"].toString()) ? con.removeItem(
                              marketData["_id"].toString()) : con.addItem(
                              lmeIds: [marketData["_id"].toString()]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: con.lmeWatchlistIds.value.contains(
                              marketData["_id"].toString())
                              ? Icon(
                            Icons.bookmark, color: ColorConstants.primeryColor,)
                              : Icon(Icons.bookmark_border_rounded),
                        ),
                      );
                    },
              )
            ],
          ),
          // SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.access_time, size: 14, color: Colors.grey),
              SizedBox(width: 4),
              Text(
                "${DateTime.now().toString().split(' ')[1].split(".")[0]}",
                style: GoogleFonts.poppins(
                  fontSize: 14,
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
    // Check if the percentage change is positive or negative


    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Latest price, with conditional color
          Text(
            marketData['latestPrice'] ?? '',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: isPriceNegative ?  Colors.red:Colors.green , // Color based on change
            ),
          ),

          // SizedBox(height: 8),
          Text(
            "${marketData['riseFall'] ?? ''} (${marketData['risefall'] ?? ''})",
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
       
        ],
      ),
    );
  }
  Widget _buildhighlow(BuildContext context) {


    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Latest price, with conditional color

          Text(
            "${marketData['highest'] ?? ''} (High)",
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "${marketData['lowest'] ?? ''} (Low)",
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),

        ],
      ),
    );
  }
}
