import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/features/future/pages/LME_Page/pages/Warehouse_Stock/controller/warehouse_con.dart';
import 'package:market_hub_application/shared/components/loading_page/ui/loading_page.dart';

class WarehousePage extends StatelessWidget {
  final WarehouseCon controller = Get.put(WarehouseCon());

  @override
  Widget build(BuildContext context) {
    var elementStyle=GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14,color: Colors.black54);
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      appBar: AppBar(
        title: Row(children: [
          Expanded(child: Text(textAlign: TextAlign.center,"Syb", style: elementStyle)),
          Expanded(child: Text(textAlign: TextAlign.center,"Open", style: elementStyle)),
          Expanded(child: Text(textAlign: TextAlign.center,"Close", style: elementStyle)),
          Expanded(child: Text(textAlign: TextAlign.center,"Live", style: elementStyle)),
          Expanded(child: Text(textAlign: TextAlign.center,"Can", style: elementStyle)),
          Expanded(child: Text(textAlign: TextAlign.center,"Chn", style: elementStyle)),
          Expanded(child: Text(textAlign: TextAlign.center,"Chn%", style:elementStyle)),

        ],),
        backgroundColor: ColorConstants.primeryColor.withOpacity(0.1),
      ),
      body: Obx(() {
        if (controller.warehouseData.value.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: LoadingPage(cardSize: 80,),
          );
        }
        return ListView.builder(
          itemCount: controller.warehouseData.length,
          itemBuilder: (context, index) {
            final stock = controller.warehouseData[index];
            return Column(
              children: [
                // SizedBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Expanded(child: Text(stock.symbol, style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 14,),overflow: TextOverflow.ellipsis,)),
                      SizedBox(width: 5,),
                      Expanded(child: Text(textAlign: TextAlign.center,stock.open.toString(), style: elementStyle)),
                      Expanded(child: Text(textAlign: TextAlign.center,stock.close.toString(), style: elementStyle)),
                      Expanded(child: Text(textAlign: TextAlign.center,stock.live.toString(), style: elementStyle)),
                      Expanded(child: Text(textAlign: TextAlign.center,stock.cancel.toString(), style:elementStyle)),
                      Expanded(child: Text(textAlign: TextAlign.center,(stock.change).toString(), style: elementStyle)),
                      Expanded(child: Text(textAlign: TextAlign.center,"${((stock.percentageChange*100).round()/100).toString()}%", style: elementStyle)),

                    ],
                  ),
                ),
                // SizedBox(height: 16,),
                Divider()
              ],
            );
          },
        );
      }),
    );
  }
}
