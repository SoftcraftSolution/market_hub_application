import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/features/spot_price/pages/base_matel_detail_page/controller/base_metal_con.dart';
import 'package:market_hub_application/features/spot_price/pages/base_matel_detail_page/page/list_sport_page.dart';
import 'package:market_hub_application/shared/components/loading_page/widget/loading_card.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../shared/widget/bottom_sheet/categ_bottom_sheet/ui/categ_bottom_sheet.dart';

class BaseMetalPage extends StatefulWidget {
  String category;
   BaseMetalPage({required this.category});

  @override
  State<BaseMetalPage> createState() => _BaseMetalPageState();
}

class _BaseMetalPageState extends State<BaseMetalPage> {
  late BaseMetalCon con;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    Get.delete<BaseMetalCon>(force: true);
    Print.p("disposee");
  }
  @override
  Widget build(BuildContext context) {
    con=Get.put(BaseMetalCon(category: widget.category));
    return Scaffold(backgroundColor: ColorConstants.backgroundColor,
    appBar: AppBar(backgroundColor: ColorConstants.backgroundColor,title: Text("Base Metal (${widget.category})",style: GoogleFonts.poppins(fontWeight: FontWeight.w700),),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(()=> topOptionBar()),
            Obx(()=> secOptionBar()),
            GestureDetector(
              onTap: (){
                con.showCityFilterBottomSheet();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.grey)),
                child: Row(
                  children: [


                    Text("Filter",style: GoogleFonts.poppins(),),
                    SizedBox(width: 10,),
                    Icon(Icons.filter_list,color: Colors.grey,),
                  ],
                ),
                )
              ],),
            ),
            Expanded(child: SpotListPage())
        ],),
      ),
    );
  }

  Widget topOptionBar(){
    if (con.spotListResponse.value == null) {
      // Show progress indicator while fetching data
      return LoadingCard(cardSize: 70);
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(18),
              ),
              clipBehavior: Clip.hardEdge,
              child: Obx(
                    ()=> Row(
                  children: List.generate(con.spotListResponse.value!.types.length, (index) {
                    return GestureDetector(
                      onTap: () {
                       con.setTopOptionIndex(index); // Call the method to update the index
                      },
                      child: Container(
                        constraints: BoxConstraints(minWidth: 100),
                        padding: EdgeInsets.symmetric(vertical: 14,horizontal: 18),
                        decoration: BoxDecoration(
                          color: con.topOptionIndex.value == index
                              ? ColorConstants.primeryColor
                              : Colors.transparent,
                          border: Border(
                            left: BorderSide(color: Colors.grey),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            con.spotListResponse.value!.types[index],
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color:  con.topOptionIndex.value == index
                                  ? Colors.white
                                  : Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget secOptionBar(){
    if (con.spotListResponse.value == null) {
      // Show progress indicator while fetching data
      return LoadingCard(cardSize: 70);
    }
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return CategBottomSheet(elements: con.spotListResponse.value!.typeSubcategoryList[con.topOptionIndex.value].subcategories,onApplyChanges: con.setSecOptionIndex,initialIndex: con.secOptionIndex.value,);
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SizedBox(
              width: 25,
              child: Image.asset("assets/icon/c.png"),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: SizedBox(
              height: 35,
              child:
              ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: con.spotListResponse.value!.typeSubcategoryList[con.topOptionIndex.value].subcategories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Obx(
                        ()=> GestureDetector(
                      onTap: () {
                        con.setSecOptionIndex(index); // Update index on tap
                      },
                      child: Padding(
                        padding:  EdgeInsets.only(right: 20) ,
                        child: Container(
                          decoration: BoxDecoration(
                            border: con.secOptionIndex.value == index
                                ? Border(
                              bottom: BorderSide(
                                width: 4,
                                color: ColorConstants.primeryColor,
                              ),
                            )
                                : null,
                          ),
                          child: Text(
                            con.spotListResponse.value!.typeSubcategoryList[con.topOptionIndex.value].subcategories[index],
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color:   con.secOptionIndex.value == index
                                  ? ColorConstants.primeryColor
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),

            ),
          ),
        ),
      ],
    );
  }
}
