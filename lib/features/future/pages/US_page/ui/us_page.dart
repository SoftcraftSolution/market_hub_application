import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/features/future/pages/MCX_Page/controller/mcx_controller.dart';
import '../../../../../shared/components/loading_page/ui/loading_page.dart';
import '../../MCX_Page/component/mcx_item_widget.dart';

class UsPage extends StatelessWidget {
  UsPage({super.key});

  final mcxCon = Get.put(MCXPageCon());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      body: Column(
        children: [
          Expanded(
            flex: 12,
            child: Obx(() {
              // Check if the filtered data is empty
              if (mcxCon.usData.isEmpty) {
                return  Padding(
                  padding: EdgeInsets.all(20),
                  child: LoadingPage(),
                );
              }

              // Render ListView with USData
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: mcxCon.usData.length,
                  itemBuilder: (context, index) {
                    final marketData = mcxCon.usData[index];

                    // Skip ad-related data
                    if (marketData['Symbol'] ==
                        "googletag.cmd.push(function() { googletag.display('ad_content_middle_bottom_responsive'); });") {
                      return const SizedBox();
                    }

                    return MCXItemWidget(
                      marketData: marketData,
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
