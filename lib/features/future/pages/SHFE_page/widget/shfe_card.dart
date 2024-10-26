import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/features/future/pages/SHFE_page/model/shfe_model.dart';

class SHFECard extends StatelessWidget {
  final SHFE_model price;

  const SHFECard({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPriceNegative = price.change.startsWith('-');

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
            Divider(color: Colors.grey.shade300),
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
                price.description,
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
          price.price,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 20,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildDetailWithIcon(Icons.arrow_upward, "High: ${price.high}", Colors.green),
            _buildDetailWithIcon(Icons.arrow_downward, "Low: ${price.low}", const Color(0xFFEF5B4F)),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildDetailWithIcon(Icons.show_chart, "Change: ${price.change} (${price.change})", isPriceNegative ? Colors.red : Colors.green),
            Text(
              "Vol: ${price.volume}",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            // _buildDetailWithIcon(Icons.v, "Vol: ${price.volume}",Colors.grey),
          ],
        ),
        // _buildDetailWithIcon(Icons.show_chart, "Change: ${price.change} (${price.change})", isPriceNegative ? Colors.red : Colors.green),
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
      "Last Updated: ${DateTime.now().toLocal().toString().split(' ')[1].split(".")[0]}",
      style: GoogleFonts.poppins(
        fontSize: 12,
        color: Colors.grey,
      ),
    );
  }
}
