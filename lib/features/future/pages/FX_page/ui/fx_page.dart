import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/shared/components/loading_page/ui/loading_page.dart';

import '../controller/fx_controller.dart';
import '../widget/fx_card.dart';

class FXPage extends StatelessWidget {
  FXPage({super.key}); // Change the constructor name here

  final FXPageCon fxCon = Get.put(FXPageCon());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Check if the data is empty and show loading indicator if needed
      if (fxCon.fx_data.isEmpty) {
        return Center(child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: LoadingPage(),
        )); // Loading page widget
      }

      return ListView.builder(
        itemCount: fxCon.fx_data.length,
        itemBuilder: (context, index) {
          return FXCard(price: fxCon.fx_data[index],
          );
        },
      );
    });
  }
}
