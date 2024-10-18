import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/features/future/pages/LME_Page/controller/lmePageController.dart';
import 'package:market_hub_application/features/future/pages/LME_Page/pages/LME_Future/ui/lme_future_page.dart';
import 'package:market_hub_application/shared/components/loading_page/ui/loading_page.dart';
import 'package:market_hub_application/shared/components/test_screen.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../shared/widget/optionBar/list_option_without_border.dart';
import '../pages/LME_Future/component/lme_item_widget.dart';
import '../../../controller/futureController.dart';

class LMEPage extends StatelessWidget {
  LMEPage({super.key});
var con=Get.put(LMEPageCon());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Print.p("Categuries");
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: SizedBox(
                      width: 25,
                      child: Image.asset("assets/icon/c.png"),
                    ),
                  ),
                ),
                Expanded(
                    child: ListOptionWithoutBorder(elements: [
                  "LME Future",
                  "Warehouse Stock(official)",
                  "Settelment"
                ], onIndexChanged: LMEPageIndexChange().onIndexChange,controller: con,)),
              ],
            ),
          ),
          Expanded(
            flex: 12,
            child:
            Obx(() =>con.pageIndex.value==0?LmeFuturePage():con.pageIndex.value==1?TestScreen("Warehouse Stock"):TestScreen("Settelmeent")
            ),
          ),
        ],
      )),
    );
  }
}
