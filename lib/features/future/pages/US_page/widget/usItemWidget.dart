import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class USItemWidget extends StatelessWidget {
  final Map<String, dynamic> marketData;

  USItemWidget({required this.marketData});

  @override
  Widget build(BuildContext context) {
    bool isPriceNegative = marketData['Change'].startsWith('-');

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
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSymbolSection(isPriceNegative),
            const SizedBox(height: 10),
            _buildPriceSection(isPriceNegative),
            const SizedBox(height: 10),
            Divider(),
          ],
        ),
      ),
    );
  }

  Widget _buildSymbolSection(bool isPriceNegative) {
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
                    fontSize: 17,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 5),
              Icon(
                isPriceNegative ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                color: isPriceNegative ? Colors.red : Colors.green,
                size: 26,
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
              fontSize: 16,
              color: isPriceNegative ? Colors.red : Colors.green,
            ),
          ),
        ),

      ],
    );
  }

  Widget _buildPriceSection(bool isPriceNegative) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(Icons.access_time, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                "${DateTime.now().toString().split(' ')[1].split('.')[0]}",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        _buildDetail(
          "${marketData['Change'] == "" ? 'N/A' : marketData['Change']} (${marketData['ChangePercent'] ?? 'N/A'})",
          isPriceNegative ? Colors.red : Colors.green,
        ),

      ],
    );
  }

  Widget _buildDetail(String text, Color color) {
    return Expanded(
      child: Text(
        textAlign: TextAlign.end,
        text,
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: color,
        ),
      ),
    );
  }
}
