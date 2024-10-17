import 'package:flutter/material.dart';

import '../../../widget/news_item.dart';

class TechnicalAnalysisPage extends StatelessWidget {
  const TechnicalAnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount:10,padding:EdgeInsets.zero,itemBuilder: (context,index){
      return NewsItem(
          img: "img",
          title:
          "Global Copper Cathode Stocks: Increasing or Decreasing Post-Price Swings?",
          subTitle:
          "We’re pleased to introduce the latest enhancements in our templating experienceWe’re pleased to introduce the latest enhancements in our templating experience...",
          time: "14h ago");
    });;
  }
}
