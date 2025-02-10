import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/features/alert/pages/self_news/controller/self_news_con.dart';
import 'package:market_hub_application/features/alert/widget/news_item.dart';
import 'package:market_hub_application/shared/components/loading_page/ui/loading_page.dart';


class SelfNewsPage extends StatelessWidget {
  SelfNewsPage({super.key});
  var con = Get.put(SelfNewsController());
  @override
  Widget build(BuildContext context) {
    return Obx(()=>con.newsList.value.isEmpty?con.isLoading.value?LoadingPage(cardSize: 250,):Center(child: Text("No Data Found.",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w600),),):
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
