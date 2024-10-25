import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/features/future/pages/FX_page/ui/fx_page.dart';
import 'package:market_hub_application/features/future/pages/LME_Page/ui/lmePage.dart';
import 'package:market_hub_application/features/future/pages/LME_Page/pages/LME_Future/component/lme_item_widget.dart';
import 'package:market_hub_application/features/future/pages/SHFE_page/ui/shfe_page.dart';
import 'package:market_hub_application/features/future/pages/US_page/ui/us_page.dart';
import 'package:market_hub_application/features/future/pages/refrence_rate_page/ui/refrance_rate_page.dart';
import 'package:market_hub_application/shared/widget/optionBar/list_option_without_border.dart';
import 'package:market_hub_application/shared/widget/optionBar/option_bar_with_border.dart';

import '../../../core/utils/utils.dart';
import '../../../shared/components/test_screen.dart';
import '../controller/futureController.dart';
import '../pages/MCX_Page/ui/mcx_page.dart';

class FuturePage extends StatelessWidget {
  final FutureController futureCon = Get.put(FutureController()); // Replace with your API URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      body: SafeArea(
        child: Obx(
            ()=> Column(children: [
            OptionBarWithBorder(options: ["London","India","China","US","FX","Refrence Rate"], onIndexChanged: FutureIndexChange().onIndexChange,controller: futureCon,),
           Expanded(child: futureCon.pageIndex.value==0?LMEPage():futureCon.pageIndex.value==1?McxPage():futureCon.pageIndex.value==2?ShfePage():futureCon.pageIndex.value==3?UsPage():futureCon.pageIndex.value==4?FXPage():RefRatePage())
            // Expanded(child: Placeholder()),
          ],),
        ),
      ),
    );
  }
}