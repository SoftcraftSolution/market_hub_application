import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/features/future/pages/LME_Page/ui/lmePage.dart';
import 'package:market_hub_application/features/spot_price/component/market_item_widget.dart';
import 'package:market_hub_application/shared/widget/optionBar/list_option_without_border.dart';
import 'package:market_hub_application/shared/widget/optionBar/option_bar_with_border.dart';

import '../../../core/utils/utils.dart';
import '../../../shared/components/test_screen.dart';
import '../controller/futureController.dart';

class FuturePage extends StatelessWidget {
  final FutureController _apiController = Get.put(FutureController()); // Replace with your API URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      body: SafeArea(
        child: Obx(
            ()=> Column(children: [
            OptionBarWithBorder(options: ["LME","MCX","SHFE","US","FX","Refrence Rate"], onIndexChanged: FutureIndexChange().onIndexChange),
           Expanded(child: _apiController.pageIndex.value==0?LMEPage():TestScreen("comming soon..."))
            // Expanded(child: Placeholder()),
          ],),
        ),
      ),
    );
  }
}