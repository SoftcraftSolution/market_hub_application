import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/core/theme/theme.dart';
import 'package:market_hub_application/features/alert/pages/live_feed/ui/live_feed_page.dart';
import 'package:market_hub_application/features/alert/pages/self_news/ui/self_news_page.dart';
import 'package:market_hub_application/features/alert/pages/technical_analysis/ui/technical_analysis_page.dart';
import 'package:market_hub_application/shared/widget/optionBar/option_bar_with_border.dart';

import '../../../shared/components/test_screen.dart';
import '../controller/alert_controller.dart';
import '../widget/news_item.dart';

class AlertPage extends StatelessWidget {
  AlertPage({super.key});
  var options = [
    "Technical Analysis",
    "Self News",
    "Live Feed",
    "Economic calendar",
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
            OptionBarWithBorder(options: options,onIndexChanged: AlertIndexChange().onIndexChange,controller: controller,),
            // SizedBox(height: 16,),
            Expanded(
                flex: 12,
                child: Obx(
                  ()=> Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                      child: controller.pageIndex.value==0?TechnicalAnalysisPage():controller.pageIndex.value==1?SelfNewsPage():controller.pageIndex.value==2?LiveFeedPage():controller.pageIndex.value==3?TestScreen("Economic calendar"):TestScreen("Circular")
                  ),
                )),
        
        
          ],
        ),
      ),
    );
  }




}





