import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/fx_model.dart';

class FXCard extends StatelessWidget {
  final FX_model price;

  const FXCard({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPriceNegative = price.change.startsWith('-');
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
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
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSymbolSection(isPriceNegative),
                const SizedBox(height: 10),
                Divider(color: Colors.grey.shade300),
                const SizedBox(height: 10),
                _buildPriceSection(isPriceNegative),
                const SizedBox(height: 10),
                _buildLastUpdatedSection(),
              ],
            ),
          ),
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
                price.name,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(width: 20),
              Icon(
                price.change.startsWith('-') ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                color: price.change.startsWith('-') ? Colors.red : Colors.green,
                size: 30,
              ),
            ],
          ),
        ),
        Text(
          price.last,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: isPriceNegative ? Colors.red : Colors.green,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceSection(bool isPriceNegative) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildDetailWithIcon(Icons.trending_up, "Open: ${price.open}", Colors.grey),
            _buildDetailWithIcon(Icons.arrow_upward, "High: ${price.high}", Colors.green),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildDetailWithIcon(Icons.arrow_downward, "Low: ${price.low}", const Color(0xFFEF5B4F)),
            _buildDetailWithIcon(Icons.show_chart, "Change: ${price.change}", isPriceNegative ? Colors.red : Colors.green),
          ],
        ),
        const SizedBox(height: 8),
        _buildDetailWithIcon(Icons.trending_up, "Percent Change: ${price.percentChange}", isPriceNegative ? Colors.red : Colors.green),
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
      "Last Updated: ${DateTime.now().toLocal().toString().split('.')[0]}",
      style: GoogleFonts.poppins(
        fontSize: 12,
        color: Colors.grey,
      ),
    );
  }
}
