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
      padding: const EdgeInsets.all(4.0),
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
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                '\u20B9${item.price}', // Format price to 2 decimal places
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child:Text(
                  '', // Format the updatedAt date
                  style: GoogleFonts.poppins(color: Colors.grey[700]),
                ),
              ),
              Text(
                item.incrementPrice, // Format price to 2 decimal places
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: item.incrementPrice.contains("-")?Colors.red:Colors.green,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child:Text(
                  'Last Updated: ${formatDate(item.updatedAt)}', // Format the updatedAt date
                  style: GoogleFonts.poppins(color: Colors.grey[700],fontSize: 16,fontWeight: FontWeight.w500,),
                ),
              ),
              Text(
                'Closing: \u20B9${item.lastPrice}', // Format price to 2 decimal places
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),

          Divider(color: Colors.grey[400]), // Add a divider for separation
        ],
      ),
    );
  }
}
