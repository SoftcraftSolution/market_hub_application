import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/shared/components/loading_page/ui/loading_page.dart';

import '../component/lme_item_widget.dart';
import '../../../controller/lmePageController.dart';
import '../controller/lme_future_con.dart';

class LmeFuturePage extends StatelessWidget {
   LmeFuturePage({super.key});
  var lmeCon = Get.put(LMEFuturePageCon());
  @override
  Widget build(BuildContext context) {
    return Obx(()=>lmeCon.lme_data.value.isEmpty?Padding(
      padding: const EdgeInsets.all(20.0),
      child: LoadingPage(),
    ):
    ListView.builder(
      itemCount: lmeCon.lme_data.value.length,
      itemBuilder: (context, index) {
        return LMEItemWidget(
          marketData: lmeCon.lme_data.value[index],
        );
      },
    ));
  }
}
