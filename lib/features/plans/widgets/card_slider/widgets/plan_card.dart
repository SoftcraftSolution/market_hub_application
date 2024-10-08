import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/features/plans/widgets/card_index_traker/controller/card_index_tracker_controller.dart';

class PlanCard extends StatelessWidget {
  final int index;
  List topTitleColor;
  bool isTrial;
  String title;
  String subTitle;
  List features;

  PlanCard(this.index,
      {required this.topTitleColor,
      required this.isTrial,
      required this.title,
      required this.subTitle,
      required this.features});
  var trakerCon = Get.find<CardIndexTrackerController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          clipBehavior: Clip.hardEdge,
          // margin: EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(25),
            boxShadow: trakerCon.activeIndex.value == index
                ? [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8.0,
                        spreadRadius: 1.0)
                  ]
                : [],
          ),
          child: Column(
            children: [
              // top
              Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          topTitleColor[0], // Starting color
                          topTitleColor[1], // Ending color
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        isTrial
                            ? "Try 1 week free trial"
                            : "Your plan has expired",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                            decorationColor: Colors.white),
                      ),
                    ),
                  )),
              Expanded(
                  flex: 19,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 16),
                    child: Column(
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: ColorConstants.blueColorApp),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            textAlign: TextAlign.left,
                            "\"$subTitle\"",
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                color: Color(0xff646464)),
                          ),
                        ),
                        Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: List.generate(features.length, (index) => Container(
                                                          padding: EdgeInsets.symmetric(vertical: 12),
                              // decoration: BoxDecoration(border: Border.all()),
                              child: Row(children: [
                                Icon(Icons.task_alt,color: Color(0xff038041),),SizedBox(width: 8,),
                                Expanded(child: Text(features[index],style: GoogleFonts.nunito(fontSize: 18,fontWeight: FontWeight.w700,color: Color(0xff646464)),)),
                              
                              
                              
                              ],),
                                                        )),
                                                      ),
                            )),
                      ],
                    ),
                  )),
              Expanded(flex: 3, child: Placeholder()),
            ],
          ),
        ),
      ),
    );
  }
}
