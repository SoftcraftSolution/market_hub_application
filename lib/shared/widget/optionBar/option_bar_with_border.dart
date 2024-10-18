import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/color_constant.dart';

class OptionBarWithBorder extends StatelessWidget {
  final List<String> options; // Options to display
  final Function(int) onIndexChanged;
  final controller;// Callback function for index changes

  OptionBarWithBorder({
    Key? key,
    required this.options,
    required this.onIndexChanged,
    required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(18),
                ),
                clipBehavior: Clip.hardEdge,
                child: Obx(
                  ()=> Row(
                    children: List.generate(options.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          onIndexChanged(index); // Call the method to update the index
                        },
                        child: Container(
                          constraints: BoxConstraints(minWidth: 100),
                          padding: EdgeInsets.symmetric(vertical: 14,horizontal: 18),
                          decoration: BoxDecoration(
                            color: controller.pageIndex.value == index
                                ? ColorConstants.primeryColor
                                : Colors.transparent,
                            border: Border(
                              left: BorderSide(color: Colors.grey),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              options[index],
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: controller.pageIndex.value == index
                                    ? Colors.white
                                    : Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
