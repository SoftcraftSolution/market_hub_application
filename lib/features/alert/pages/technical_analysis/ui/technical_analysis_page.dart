import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/features/alert/pages/technical_analysis/controller/technical_news_con.dart';

import '../../../../../shared/components/loading_page/ui/loading_page.dart';
import '../../../widget/news_item.dart';

class TechnicalAnalysisPage extends StatelessWidget {
   TechnicalAnalysisPage({super.key});
  var con = Get.put(TechnicalNewsCon());
  @override
  Widget build(BuildContext context) {
    return Obx(()=>con.newsList.value.isEmpty?LoadingPage(cardSize: 250,):
    ListView.builder(
      itemCount: con.newsList.value.length,
      itemBuilder: (context, index) {
        return NewsItem(
          news: con.newsList.value[index],
        );
      },
    ));
  }
}



