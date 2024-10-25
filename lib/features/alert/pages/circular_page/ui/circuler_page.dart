import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/features/alert/pages/circular_page/controller/circuler_con.dart';
import 'package:market_hub_application/features/alert/pages/technical_analysis/controller/technical_news_con.dart';

import '../../../../../shared/components/loading_page/ui/loading_page.dart';
import '../../../widget/news_item.dart';

class CirculerPage extends StatelessWidget {
  CirculerPage({super.key});
  var con = Get.put(CirculerCon());
  @override
  Widget build(BuildContext context) {
    return Obx(()=>con.circulerList.value.isEmpty?LoadingPage(cardSize: 250,):
    ListView.builder(
      itemCount: con.circulerList.value.length,
      itemBuilder: (context, index) {
        return NewsItem(
          news: con.circulerList.value[index],
        );
      },
    ));
  }
}


