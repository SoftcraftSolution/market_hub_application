import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/features/future/pages/MCX_Page/controller/mcx_controller.dart';

import '../../../../../shared/components/loading_page/ui/loading_page.dart';
import '../../LME_Page/pages/LME_Future/component/lme_item_widget.dart';
// import '../../../component/mcx_item_widget.dart';
import '../component/mcx_item_widget.dart';

class McxPage extends StatelessWidget {
  McxPage({super.key});
  var mcxCon=Get.put(MCXPageCon());

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: ColorConstants.backgroundColor,body: Column(children: [
      Expanded(
        flex: 12,
        child:
        Obx(() =>mcxCon.data.value.isEmpty?Padding(
          padding: const EdgeInsets.all(20),
          child: LoadingPage(),
        ):
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: mcxCon.mcxdata.value.length,
            itemBuilder: (context, index) {
              if(mcxCon.mcxdata.value[index]['Symbol']=="googletag.cmd.push(function() { googletag.display('ad_content_middle_bottom_responsive'); });"){
                return SizedBox();
              }
              return MCXItemWidget(
                marketData: mcxCon.mcxdata.value[index],
              );
            },
          ),
        )
        ),
      ),
    ],),);
  }
}
