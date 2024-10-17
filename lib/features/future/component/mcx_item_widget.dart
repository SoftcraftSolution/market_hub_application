import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MCXItemWidget extends StatelessWidget {
  final Map<String, dynamic> marketData;

  MCXItemWidget({required this.marketData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          _buildMarketDataSection(context),
          Divider()
        ],
      ),
    );
  }


  Widget _buildMarketDataSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildSymbolSection(context),
          _buildPriceSection(context),
        ],
      ),
    );
  }

  Widget _buildSymbolSection(BuildContext context) {
    bool isPriceNegative = marketData['Change'] != null && marketData['Change'].startsWith('-');
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  (marketData['Symbol'] ?? '').toString().replaceAll("MCX", "").trim(), // Assuming you want the second word
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 4),
              isPriceNegative
                  ? Icon(Icons.arrow_drop_down, color: Colors.red, size: 30)
                  : Icon(Icons.arrow_drop_up, color: Colors.green, size: 30),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.access_time, size: 14, color: Colors.grey),
              SizedBox(width: 4),
              Text(
                marketData['LastTrade'] ?? '',
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
    bool isPriceNegative = marketData['Change'] != null && marketData['Change'].startsWith('-');

    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Latest price, with conditional color
          Text(
            marketData['Last'] ?? '',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: isPriceNegative ? Colors.red : Colors.green, // Color based on change
            ),
          ),
          SizedBox(height: 6),
          // Highest price
          Text(
            "(${marketData['High'] ?? ''}) High",
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 4),
          // Net change
          Text(
            "(${marketData['Change'] ?? ''}) Net Chg",
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: isPriceNegative ? Colors.red : Colors.green,
            ),
          ),
          SizedBox(height: 4),
          // Percentage change
          Text(
            "(${marketData['ChangePercent'] ?? ''}) Chg %",
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: isPriceNegative ? Colors.red : Colors.green, // Match percentage color
            ),
          ),
        ],
      ),
    );
  }
}
