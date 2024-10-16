import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/core/theme/theme.dart';
import 'package:market_hub_application/shared/widget/optionBar/option_bar_with_border.dart';

import '../../../shared/components/test_screen.dart';
import '../component/news_item.dart';
import '../controller/alert_controller.dart';

class AlertPage extends StatelessWidget {
  AlertPage({super.key});
  var options = [
    "Technical Analysis",
    "Self News",
    "Live Feed",
    "Twitter Feed",
    "Circular"
  ];

  var controller = Get.put(AlertCon());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            OptionBarWithBorder(options: options,onIndexChanged: AlertIndexChange().onIndexChange,),
            // SizedBox(height: 16,),
            Expanded(
                flex: 12,
                child: Obx(
                  ()=> Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                      child: controller.index.value==0?techAnalysis():controller.index.value==1?TestScreen("self News"):controller.index.value==2?TestScreen("liveFeed"):controller.index.value==3?TestScreen("Twitter Feed"):TestScreen("Circular")
                  ),
                )),
        
        
          ],
        ),
      ),
    );
  }


  Widget techAnalysis(){
    return ListView.builder(itemCount:10,padding:EdgeInsets.zero,itemBuilder: (context,index){
      return NewsItem(
          img: "img",
          title:
          "Global Copper Cathode Stocks: Increasing or Decreasing Post-Price Swings?",
          subTitle:
          "We’re pleased to introduce the latest enhancements in our templating experienceWe’re pleased to introduce the latest enhancements in our templating experience...",
          time: "14h ago");
    });
  }

}





