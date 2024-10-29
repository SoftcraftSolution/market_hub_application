import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/shared/components/loading_page/ui/loading_page.dart';

import '../../../widget/sport_card.dart';
import '../controller/base_metal_con.dart'; // Import your card widget

class SpotListPage extends StatelessWidget {
  final BaseMetalCon controller = Get.find<BaseMetalCon>();

  @override
  Widget build(BuildContext context) {
    return

       Obx(() {
        // Check if the spotListResponse is null
        if (controller.spotListResponse.value == null) {
          return Center(child: LoadingPage(cardSize: 50,));
        }

        // If the data is loaded, show the filtered items
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.builder(
            itemCount: controller.filteredItems.length,
            itemBuilder: (context, index) {
              final item = controller.filteredItems[index];
              return SpotItemCard(item: item); // Use the SpotItemCard widget
            },
          ),
        );
      });

  }
}
