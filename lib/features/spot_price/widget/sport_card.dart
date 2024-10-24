import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/utils/utils.dart';
import '../model/item_model.dart'; // Import your model

class SpotItemCard extends StatelessWidget {
  final SpotItem item;

  const SpotItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  item.city,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                '\u20B9${item.price}', // Format price to 2 decimal places
                style: GoogleFonts.poppins(fontSize:22,fontWeight:FontWeight.w700,color: Colors.grey[700]),
              ),
            ],
          ),
          const SizedBox(height: 8), // Add space between rows
          Text(
            'Closing Time: ${formatDate(DateTime.now())}', // Use 'N/A' as default if closingTime is null
            style: GoogleFonts.poppins(color: Colors.grey[700]),
          ),
          const SizedBox(height: 4),
          Text(
            'Closing Price: \u20B910', // Format closing price or use 'N/A'
            style: GoogleFonts.poppins(color: Colors.grey[700]),
          ),
          const SizedBox(height: 8),
          Divider(color: Colors.grey[400]), // Add a divider for separation
        ],
      ),
    );
  }
}
