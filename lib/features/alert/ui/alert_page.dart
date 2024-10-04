import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/core/theme/theme.dart';

class AlertPage extends StatelessWidget {
  AlertPage({super.key});
  var options = [
    "Technical Analysis",
    "Self News",
    "Live Feed",
    "Twitter Feed",
    "Circular"
  ];

  var controller = Get.put(AlertCon());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      body: Column(
        children: [
          optionBar(),
          // SizedBox(height: 16,),
          Expanded(
              flex: 12,
              child: Obx(
                ()=> Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    child: controller.index.value==0?techAnalysis():controller.index.value==1?testScreen("self News"):controller.index.value==2?testScreen("liveFeed"):controller.index.value==3?testScreen("Twitter Feed"):testScreen("Circular")
                ),
              )),


        ],
      ),
    );
  }

  Widget optionBar() {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Row(
                    children: List.generate(5, (index) {
                      return Obx(
                        () => GestureDetector(
                          onTap: () {
                            controller.setIndex(index);
                          },
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: controller.index.value == index
                                    ? ColorConstants.primeryColor
                                    : Colors.transparent,
                                border: Border(
                                    left: BorderSide(color: Colors.grey))),
                            child: Text(
                              options[index],
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: controller.index.value == index
                                      ? Colors.white
                                      : Colors.black.withOpacity(0.5)),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget techAnalysis(){
    return ListView.builder(itemCount:10,padding:EdgeInsets.zero,itemBuilder: (context,index){
      return NewsItem(
          img: "img",
          title:
          "Global Copper Cathode Stocks: Increasing or Decreasing Post-Price Swings?",
          subTitle:
          "We’re pleased to introduce the latest enhancements in our templating experienceWe’re pleased to introduce the latest enhancements in our templating experience...",
          time: "14h ago");
    });
  }
  Widget testScreen(String name){
    return Center(child: Text(name,  style: GoogleFonts.poppins(
        fontWeight: FontWeight.w700, fontSize: 16),),);
  }
}

class AlertCon extends GetxController {
  RxInt index = 0.obs;
  void setIndex(int newIndex) {
    index.value = newIndex;
  }
}

class NewsItem extends StatelessWidget {
  String title;
  String subTitle;
  String img;
  String time;

  NewsItem(
      {required this.img,
      required this.subTitle,
      required this.title,
      required this.time});
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 170,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: Text(
                        maxLines: 3,
                        title,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(16),color: Colors.grey.withOpacity(0.6)),child: Center(),))
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(flex: 4, child: Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: Text(
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      subTitle,
                      style: GoogleFonts.poppins(
                        color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  )),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              time,
                              style: GoogleFonts.poppins(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Icon(
                            Icons.share,
                            size: 28,
                          )
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

