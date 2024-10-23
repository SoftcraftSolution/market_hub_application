import 'package:flutter/material.dart';

import '../../../widget/news_item.dart';

class TechnicalAnalysisPage extends StatelessWidget {
  const TechnicalAnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount:10,padding:EdgeInsets.zero,itemBuilder: (context,index){
      return Placeholder();
    });
  }
}
