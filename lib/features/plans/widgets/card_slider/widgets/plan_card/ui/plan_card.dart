import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/features/plans/widgets/card_index_traker/controller/card_index_tracker_controller.dart';
import 'package:market_hub_application/features/plans/widgets/card_slider/widgets/plan_card/controller/plan_card_action_controller.dart';
import 'package:market_hub_application/shared/widget/button/custom_button.dart';

class PlanCard extends StatelessWidget {
  final int index;
  List topTitleColor;
  bool isTrial;
  String title;
  String subTitle;
  List features;
  int amount;
  var controller;
  PlanCard(this.index,
      {required this.topTitleColor,
      required this.isTrial,
      required this.title,
      required this.subTitle,
      required this.features,
      this.amount = 0});
  var trakerCon = Get.find<CardIndexTrackerController>();
  @override
  Widget build(BuildContext context) {
    controller=PlanCardActionController(amount: amount, planName: title.split(" ")[0].toLowerCase());
    return Obx(
      () => Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          clipBehavior: Clip.hardEdge,
          // margin: EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Color(0xffF7F7F7),
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
              // middel cantantes
              Expanded(
                  flex: 19,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 16),
                    child: Column(
                      children: [
                        // plan name
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            title,
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: ColorConstants.blueColorApp),
                          ),
                        ),
                        // discription
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
                        // features
                        Expanded(
                            child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                                features.length,
                                (index) => Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      // decoration: BoxDecoration(border: Border.all()),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.task_alt,
                                            color: Color(0xff038041),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Expanded(
                                              child: Text(
                                            features[index],
                                            style: GoogleFonts.nunito(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xff646464)),
                                          )),
                                        ],
                                      ),
                                    )),
                          ),
                        )),
                      ],
                    ),
                  )),
              // eend
              Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xffEEF2FE)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 5,
                              child: isTrial?Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Free Trial",style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700,
                                    color:
                                    ColorConstants.blueColorApp,
                                    fontSize: 24),),
                              ):Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                        flex: 3,
                                        child: Row(
                                          children: [
                                            Text(
                                              "\u20b9${amount.toString()}",
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w700,
                                                  color:
                                                      ColorConstants.blueColorApp,
                                                  fontSize: 24),
                                            ),
                                            Text(
                                              " /Year",
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w700,
                                                  color:
                                                      ColorConstants.blueColorApp,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        )),
                                    Expanded(flex:2,child: Text(textAlign: TextAlign.start,"Excl. Taxes",style: GoogleFonts.poppins(fontSize: 14,color: ColorConstants.blueColorApp),)),
                                  ],
                                ),
                              )),

                          Expanded(flex: 3, child: CustomButton(title: isTrial?"Try Now":"Buy Now",fontSize: 16, onPress: isTrial?controller.onTryNow:controller.onBuyNow)),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
