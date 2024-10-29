import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/shared/components/loading_page/ui/loading_page.dart';
import '../controller/live_news_controller.dart';
import '../widget/live_feed_card.dart';

class LiveFeedPage extends StatelessWidget {
  final LiveNewsController newsController = Get.put(LiveNewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (newsController.newsList.isEmpty) {
          return LoadingPage();
        } else {
          return ListView.builder(
            itemCount: newsController.newsList.length,
            itemBuilder: (context, index) {
              return LiveFeedNewsCard(newsItem: newsController.newsList[index]);
            },
          );
        }
      }),
    );
  }
}
