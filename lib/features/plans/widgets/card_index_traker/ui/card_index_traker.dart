import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/color_constant.dart';
import '../controller/card_index_tracker_controller.dart';

class CardIndexTraker extends StatelessWidget {
   CardIndexTraker({super.key});
   var controller=Get.put(CardIndexTrackerController());
  @override
  Widget build(BuildContext context) {
    var options=["Basic","Standard","Premium"];
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width*0.9,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(18),
      ),
      clipBehavior: Clip.hardEdge,
      child: Row(
        children: List.generate(3, (index) {
          return Expanded(
            child: Obx(
                  () => Container(
                    decoration: BoxDecoration(
                        color: controller.activeIndex.value == index
                            ? ColorConstants.primeryColor
                            : Colors.transparent,
                        border: Border(
                            left: BorderSide(color: Colors.grey))),
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        options[index],
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: controller.activeIndex.value == index
                                ? Colors.white
                                : Colors.black.withOpacity(0.5)),
                      ),
                    ),
                  ),
            ),
          );
        }),
      ),
    );
  }
}
