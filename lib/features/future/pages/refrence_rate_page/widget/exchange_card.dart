// lib/widgets/exchange_rate_card.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import '../model/exchange_rate_model.dart';


class ExchangeRateCard extends StatelessWidget {
  final ExchangeRate exchangeRate;
  final bool isSbi; // Use a boolean flag here

  const ExchangeRateCard({
    Key? key,
    required this.exchangeRate,
    required this.isSbi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(exchangeRate.date, style:  GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w600,color: ColorConstants.greyColor)),
          if (isSbi) ...[
            Text(exchangeRate.below10L ?? 'N/A', style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w600,color: ColorConstants.greyColor)),
            Text(exchangeRate.above10L ?? 'N/A', style:  GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w600,color: ColorConstants.greyColor)),
          ] else ...[
            Text(exchangeRate.rbiFbill ?? 'N/A', style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w600,color: ColorConstants.greyColor)),
            // Text('USD/INR', style: TextStyle(fontSize: 16)), // or use exchangeRate.value if available
          ],
        ],
      ),
    );
  }
}
