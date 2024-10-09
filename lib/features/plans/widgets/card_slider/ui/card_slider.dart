import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/features/plans/widgets/card_index_traker/controller/card_index_tracker_controller.dart';
import 'package:market_hub_application/features/plans/widgets/card_slider/widgets/plan_card/ui/plan_card.dart';

class CardSlider extends StatelessWidget {
  bool isTrial;
  CardSlider({required this.isTrial});
  List colorList = [
    [
      Color(0xffFF7C10),
      Color(0xffFDA761),
    ],
    [
      Color(0xff5150DB),
      Color(0xff343490),
    ],
    [
      Color(0xffBC188E),
      Color(0xffE059BA),
    ],
  ];
  List plansTitle = ["Basic Plan", "Standard Plan", "Premium Plan"];
  List plansSubTitle = [
    "Access essential market data for informed decisions.",
    "Get deeper insights and broader data coverage.",
    "Unlock complete data & advanced tools for market leadership."
  ];
  List planFeatures = [
    [
      "LME Price",
      "MCX Price",
      "China Price",
      "US Price",
      "Spot Price",
      "Warehouse Stock",
      "LME Settlement"
    ],
    [
      "All Basic Plan Benefits",
      "Steel Spot Market",
      "Minor Metal Price",
      "Live LME Warehouse Stock(Full Data)",
      "Live LME Settlement",
      "Important News & Alerts",
      "Nalco/Hindalco/Vedanta Circular",
      "Hindustan Zinc Circular",
      "Bombay Metal Exchange Circular"
    ],
    [
      "All Standard Plan Benefits",
      "Live LME",
      "Live MCX",
      "Live China",
      "Live FX Rate",
      "Technical Analysis",
      "Market Report"
    ]
  ];
  List planPrice = [1600, 2600, 3600];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        // enlargeFactor: 0.7,

        height: MediaQuery.of(context).size.height * 0.75,
        // enlargeStrategy: CenterPageEnlargeStrategy.scale,
        //
        // viewportFraction: 0.8,
        onPageChanged: (index, reason) {
          Get.find<CardIndexTrackerController>()
              .editActiveIndexes(newIndex: index);
        },
      ),
      items: [0, 1, 2].map((index) {
        return Builder(
          builder: (BuildContext context) {
            return PlanCard(
              index,
              topTitleColor: colorList[index],
              isTrial: isTrial,
              title: plansTitle[index],
              subTitle: plansSubTitle[index],
              features: planFeatures[index],
              amount: planPrice[index],
            );
          },
        );
      }).toList(),
    );
  }
}
