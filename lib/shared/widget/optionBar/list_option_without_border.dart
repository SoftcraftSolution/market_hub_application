import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/color_constant.dart';

class ListOptionWithoutBorder extends StatelessWidget {
  final List<String> elements; // Options to display
  final Function(int) onIndexChanged;
  final controller;// Callback function for index changes

  ListOptionWithoutBorder({
    Key? key,
    required this.elements,
    required this.onIndexChanged,
    required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SizedBox(
          height: 35,
          child:
            ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: elements.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Obx(
                  ()=> GestureDetector(
                    onTap: () {
                      onIndexChanged(index); // Update index on tap
                    },
                    child: Padding(
                      padding:  EdgeInsets.only(right: 20) ,
                      child: Container(
                        decoration: BoxDecoration(
                          border: controller.pageIndex.value == index
                              ? Border(
                            bottom: BorderSide(
                              width: 4,
                              color: ColorConstants.primeryColor,
                            ),
                          )
                              : null,
                        ),
                        child: Text(
                          elements[index],
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color:   controller.pageIndex.value== index
                                ? ColorConstants.primeryColor
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

        ),
      );

  }
}
