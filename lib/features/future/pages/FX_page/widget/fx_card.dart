import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/fx_model.dart';

class FXCard extends StatelessWidget {
  final FXModel price;
late  bool isPriceNegative;
   FXCard({Key? key, required this.price});

  @override
  Widget build(BuildContext context) {
     isPriceNegative = price.change.startsWith('-');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSymbolSection(isPriceNegative),
          const SizedBox(height: 10),
          // _buildPriceSection(),
          // const SizedBox(height: 10),
          _buildLastUpdatedSection(),
          Divider()
        ],
      ),
    );
  }

  Widget _buildSymbolSection(bool isPriceNegative) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          (price.symbol.split("  ")[1]),
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        _buildPriceSection()
      ],
    );
  }

  Widget _buildPriceSection() {
    return Text(
      price.price.split(" ")[0],
      style: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildLastUpdatedSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.watch_later_outlined,color: Colors.grey,),
            SizedBox(width: 6,),
            Text(
              '${price.updatedAt.toLocal().toString().split(" ")[1].split(".")[0]}',
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(price.change,style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
                color: isPriceNegative ? Colors.red : Colors.green
            ),)
          ],
        )
      ],
    );
  }
}
