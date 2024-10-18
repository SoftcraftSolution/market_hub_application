import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/core/theme/theme.dart';
import 'package:market_hub_application/shared/widget/optionBar/list_option_without_border.dart';

import '../controller/spot_price_con.dart';

class SpotPricePage extends StatelessWidget {
  SpotPricePage({super.key});
  var con = Get.put(SpotPriceCon());

  @override
  Widget build(BuildContext context) {
    var elements = ["Base Metal",'Steel Minor Metal', 'BME (Bombay Metal Exchange)',];
    var metals = [
      "Copper",
      "Brass",
      "Gun Metal",
      "Lead",
      "Nickel",
      "Tin",
      "Zinc",
      "Alminum"
    ];
    var imgS = [
      "assets/metals/copper.png",
      "assets/metals/brass.png",
      "assets/metals/gunmetal.png",
      "assets/metals/lead.png",
      "assets/metals/nickel.png",
      "assets/metals/tin.png",
      "assets/metals/zinc.png",
      "assets/metals/alminum.png"
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
                 ListOptionWithoutBorder(elements: elements, onIndexChanged: SpotOptionIndexChange().onIndexChange,controller: con,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Obx(
                        () => con.pageIndex.value == 0
                            ? Wrap(
                                clipBehavior: Clip.hardEdge,
                                spacing: 14.0, // horizontal space between items
                                runSpacing:
                                    12.0, // vertical space between items
                                children: List.generate(metals.length, (index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        width: 125,
                                        height: 125,
                                        child: Image.asset(imgS[index],fit: BoxFit.cover,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 6),
                                        child: Text(
                                          metals[index],
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    ],
                                  );
                                }),
                              )
                            : Center(
                                child: Text(
                                  "Comming Soon... ",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                              ),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}


