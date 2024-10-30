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
              SizedBox(
                width: 100,
                child: Text(
                  price.description,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
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
        Expanded(
          child: Text(
            textAlign: TextAlign.center,
            price.price,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: isPriceNegative ? Colors.red : Colors.green,
            ),
          ),
        ),
        _buildDetail("${price.high} (High)", Colors.green),
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
                "${DateTime.now().toLocal().toString().split(' ')[1].split('.')[0]}",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        _buildDetail(
          "${price.change} (chg)",
          isPriceNegative ? Colors.red : Colors.green,
        ),
        _buildDetail("${price.low} (Low)", const Color(0xFFEF5B4F)),
      ],
    );
  }

  Widget _buildDetail(String text, Color color) {
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
}
