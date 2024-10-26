import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MCXItemWidget extends StatelessWidget {
  final Map<String, dynamic> marketData;

  MCXItemWidget({required this.marketData});

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
            _buildLastUpdatedSection(),
            Divider()
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
              Text(
                (marketData['Symbol'] ?? 'N/A').toString().replaceAll("MCX", "").trim(),
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(width: 5),
              Icon(
                isPriceNegative ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                color: isPriceNegative ? Colors.red : Colors.green,
                size: 30,
              ),
            ],
          ),
        ),
        Text(
          marketData['Last'] ?? 'N/A',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: isPriceNegative ? Colors.red : Colors.green,
          ),
        ),
        const SizedBox(height: 6),
      ],
    );
  }

  Widget _buildPriceSection(bool isPriceNegative) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildDetailWithIcon(Icons.arrow_upward, "${marketData['High']==""?'N/A':marketData['High']} (High)", Colors.green),
            _buildDetailWithIcon(Icons.arrow_downward, "${marketData['Low']==""?'N/A':marketData['Low']} (Low)", const Color(0xFFEF5B4F)),
          ],
        ),
        const SizedBox(height: 8),
        _buildDetailWithIcon(Icons.show_chart, "${marketData['Change']==""?'N/A':marketData['Change'] } (${marketData['ChangePercent'] ?? 'N/A'})"
            "", isPriceNegative ? Colors.red : Colors.green),

        // const SizedBox(height: 4),
        // _buildDetailWithIcon(Icons.percent, "Percent Change: ${marketData['ChangePercent'] ?? ''}", isPriceNegative ? Colors.red : Colors.green),
      ],
    );
  }

  Widget _buildDetailWithIcon(IconData icon, String text, Color color) {
    return Row(
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 6),
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildLastUpdatedSection() {
    return Text(
      "Last Updated: ${marketData['LastTrade']==""?'N/A':marketData['LastTrade']}",
      style: GoogleFonts.poppins(
        fontSize: 12,
        color: Colors.grey,
      ),
    );
  }
}
