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
            // _buildLastUpdatedSection(),
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
              Expanded(
                child: Text(
                  (marketData['Symbol'] ?? 'N/A').toString().replaceAll("MCX", "").trim(),
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                
                  ),
                
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              // const SizedBox(width: 5),
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
            textAlign: TextAlign.center,
            marketData['Last'] ?? 'N/A',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: isPriceNegative ? Colors.red : Colors.green,
            ),
          ),
        ),
        _buildDetail( "${marketData['High']==""?'N/A':marketData['High']} (High)", Colors.green),
        const SizedBox(height: 6),
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
        ),
        _buildDetail( "${marketData['Change']==""?'N/A':marketData['Change'] } (${marketData['ChangePercent'] ?? 'N/A'})"
            "", isPriceNegative ? Colors.red : Colors.green),
        _buildDetail("${marketData['Low']==""?'N/A':marketData['Low']} (Low)", const Color(0xFFEF5B4F)),
        // const SizedBox(height: 8),


        // const SizedBox(height: 4),
        // _buildDetailWithIcon(Icons.percent, "Percent Change: ${marketData['ChangePercent'] ?? ''}", isPriceNegative ? Colors.red : Colors.green),
      ],
    );
  }

  Widget _buildDetail( String text, Color color) {
    return Expanded(
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: color,
        ),
      ),
    );
  }

  // Widget _buildLastUpdatedSection() {
  //   return Text(
  //     "Last Updated: ${marketData['LastTrade']==""?'N/A':marketData['LastTrade']}",
  //     style: GoogleFonts.poppins(
  //       fontSize: 12,
  //       color: Colors.grey,
  //     ),
  //   );
  // }
}
