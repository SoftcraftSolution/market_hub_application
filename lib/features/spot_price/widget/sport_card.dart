import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/core/utils/utils.dart';
import 'package:market_hub_application/features/watchlst/page/spot_watchlist/controller/spot_watchlist_con.dart';
import '../model/item_model.dart'; // Import your model

class SpotItemCard extends StatelessWidget {
  final SpotItem item;

   SpotItemCard({Key? key, required this.item}) : super(key: key);
  var con=Get.find<SpotWatchlistController>();
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
              Row(
                children: [
                  Text(
                    item.city,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Obx(
                    ()=> GestureDetector(
                      onTap: (){
                        con.spotWatchlistIds.value.contains(item.id)?con.removeItem(item.id):con.addItem(baseMetalIds: [item.id]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: con.spotWatchlistIds.value.contains(item.id)?Icon(Icons.bookmark,color: ColorConstants.primeryColor,):Icon(Icons.bookmark_border_rounded),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Text(
                  textAlign: TextAlign.end,
                  '\u20B9${item.price}', // Format price to 2 decimal places
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.access_time, size: 18, color: Colors.grey),
                  SizedBox(width: 4),
                  Text(
                    " ${formatDate(item.updatedAt)}",
                    style: GoogleFonts.poppins(color: Colors.grey[700],fontSize: 16,fontWeight: FontWeight.w500,),
                  ),
                ],
              ),
              Text(
                item.incrementPrice.contains("-")?item.incrementPrice:"+${item.incrementPrice}", // Format price to 2 decimal places
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: item.incrementPrice.contains("-")?Colors.red:Colors.green,
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
