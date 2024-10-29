import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/features/spot_price/pages/base_matel_detail_page/ui/base_metal_page.dart';
import 'package:market_hub_application/features/watchlst/page/spot_watchlist/controller/spot_watchlist_con.dart';
import 'package:market_hub_application/shared/widget/optionBar/list_option_without_border.dart';

import '../controller/spot_price_con.dart';

class SpotPricePage extends StatelessWidget {
  SpotPricePage({super.key});
  var con = Get.put(SpotPriceCon());
  @override
  Widget build(BuildContext context) {
    Get.put(SpotWatchlistController());
    var elements = ["Base Metal", 'Steel', 'Minor Metal', 'BME',];
    var metals = [
      "COPPER", "BRASS", "ALUMINIUM", "GUNMETAL", "ZINC",
      "LEAD", "NICKEL CATHODE", "TIN",
    ];

    var imgS = [
      "assets/metals/copper.png",
      "assets/metals/brass.png",
      "assets/metals/alminum.png",
      "assets/metals/gunmetal.png",
      "assets/metals/zinc.png",
      "assets/metals/lead.png",
      "assets/metals/nickel.png",
      "assets/metals/tin.png",
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListOptionWithoutBorder(elements: elements, onIndexChanged: SpotOptionIndexChange().onIndexChange, controller: con,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Obx(
                        () => con.pageIndex.value == 0
                        ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // Number of columns
                        crossAxisSpacing: 14.0, // Horizontal space between items
                        mainAxisSpacing: 12.0, // Vertical space between items
                        childAspectRatio: 0.7, // Aspect ratio for each item (adjust as needed)
                      ),
                      itemCount: metals.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => BaseMetalPage(category: metals[index]));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                   // Ensure the image is clipped to the border radius
                                ),
                                clipBehavior: Clip.hardEdge,
                                width: double.infinity, // Ensure the width takes the full space available
                                height: 125, // Set fixed height
                                child: Image.asset(
                                  imgS[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                                child: Text(
                                  metals[index],
                                  style: GoogleFonts.poppins(

                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,),overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                        : Center(
                      child: Text(
                        "Coming Soon...",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
