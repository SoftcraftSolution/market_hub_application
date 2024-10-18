import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/features/future/pages/MCX_Page/controller/mcx_controller.dart';
import 'package:market_hub_application/features/future/pages/SHFE_page/controller/shfe_page_con.dart';
import 'package:market_hub_application/features/future/pages/SHFE_page/widget/shfe_card.dart';

import '../../../../../shared/components/loading_page/ui/loading_page.dart';
import '../../LME_Page/pages/LME_Future/component/lme_item_widget.dart';
// import '../../../component/mcx_item_widget.dart';


class ShfePage extends StatelessWidget {
  ShfePage({super.key});
  var shfeCon=Get.put(SHFE_Page_Con());

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: ColorConstants.backgroundColor,body: Column(children: [
      Expanded(
        flex: 12,
        child:
        Obx(() =>shfeCon.data.value.isEmpty?Padding(
          padding: const EdgeInsets.all(20),
          child: LoadingPage(),
        ):
        ListView.builder(
          itemCount: shfeCon.data.value.length,
          itemBuilder: (context, index) {
            return SHFECard(
              price: shfeCon.data.value[index],
            );
          },
        )
        ),
      ),
    ],),);
  }
}
