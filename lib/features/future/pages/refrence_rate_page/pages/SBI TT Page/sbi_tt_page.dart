// lib/screens/sbi_tt_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/shared/components/loading_page/ui/loading_page.dart';
import '../../controller/refrenceCon.dart';
import '../../widget/exchange_card.dart';
// Import the enum

class SbiTtPage extends StatelessWidget {
  var controller = Get.find<RefRatePageCon>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: ColorConstants.backgroundColor,
      body: Obx(() {
        if (controller.sbi_tt_data.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: LoadingPage(),
          );
        }
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Color(0xffE76821).withOpacity(0.17)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Date",style:  GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w600,color: ColorConstants.greyColor)),
                    Expanded(child: Text(textAlign: TextAlign.center,"Below 10L",style:  GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w600,color: ColorConstants.greyColor))),
                    Text("Above 10L",style:  GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w600,color: ColorConstants.greyColor)),

                    ]
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.sbi_tt_data.length,
                itemBuilder: (context, index) {
                  return ExchangeRateCard(
                    exchangeRate: controller.sbi_tt_data[index],
                    isSbi: true, // Pass enum value here
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
