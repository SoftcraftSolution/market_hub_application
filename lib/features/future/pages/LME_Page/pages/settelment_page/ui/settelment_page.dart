// // pages/settlement_page.dart
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:market_hub_application/core/constants/color_constant.dart';
// import 'package:market_hub_application/shared/components/loading_page/ui/loading_page.dart';
// import '../controller/settelment_con.dart';
//
// class SettlementPage extends StatelessWidget {
//   final SettlementController controller = Get.put(SettlementController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorConstants.backgroundColor,
//       body: Obx(() {
//         if (controller.settlements.value.isEmpty) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: LoadingPage(),
//           );
//         }
//
//         return ListView.builder(
//           itemCount: controller.settlements.length,
//           itemBuilder: (context, index) {
//             var settlement = controller.settlements[index];
//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     settlement.symbol,
//                     style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                   SizedBox(height: 8),
//                   Text('Date: ${settlement.date}',style: GoogleFonts.poppins(),),
//                   SizedBox(height: 8),
//                   _buildBidAskRow('3M Bid', settlement.threeM.bid),
//                   _buildBidAskRow('3M Ask', settlement.threeM.ask),
//                   _buildBidAskRow('Cash Bid', settlement.cash.bid),
//                   _buildBidAskRow('Cash Ask', settlement.cash.ask),
//                 ],
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
//
//   Widget _buildBidAskRow(String label, double value) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(label, style: GoogleFonts.poppins(fontSize: 16)),
//         Text(value.toString(), style: GoogleFonts.poppins(fontSize: 16)),
//       ],
//     );
//   }
// }



// pages/settlement_page.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/shared/components/loading_page/ui/loading_page.dart';
import '../controller/settelment_con.dart';

class SettlementPage extends StatelessWidget {
  final SettlementController controller = Get.put(SettlementController());
  final Map<String, String> symbolMap = {
    'Copper': 'CU',
    'Aluminium': 'Al',
    'Zinc': 'Zn',
    'Nickel': 'Ni',
    'Lead': 'Pb',
    'Tin': 'Sn',
    'Al. Alloy': 'All',
    'Nasaac': 'Na',
    'Cobalt': 'Co',
  };
  @override
  Widget build(BuildContext context) {
    var elementStyle=GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14,color: Colors.black54);
    return Scaffold(
      appBar: AppBar(
        title: _appBar(),
        backgroundColor: ColorConstants.primeryColor.withOpacity(0.1),
      ),
      backgroundColor: ColorConstants.backgroundColor,
      body: Obx(() {
        if (controller.settlements.value.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: LoadingPage(),
          );
        }

        return ListView.builder(
          itemCount: controller.settlements.length,
          itemBuilder: (context, index) {
            var settlement = controller.settlements[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(symbolMap[settlement.symbol].toString(), style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w600)),
                          Text(settlement.date.toString(), style: GoogleFonts.poppins(fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
                  // _buildBidAskRow(settlement.symbol, settlement.date),
                  // VerticalDivider(color: Colors.grey,),
                  _buildBidAskRow(settlement.threeM.bid.toString(), settlement.threeM.ask.toString()),
                  // VerticalDivider(color: Colors.grey,),
                  _buildBidAskRow(settlement.cash.bid.toString(), settlement.cash.ask.toString()),

                ],
              ),
            );
          },
        );
      }),
    );
  }

  Widget _buildBidAskRow(String bid, String ask) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(bid.toString(), style: GoogleFonts.poppins(fontSize: 14)),
            Text(ask.toString(), style: GoogleFonts.poppins(fontSize: 14)),
          ],
        ),
      ),
    );
  }
  Widget _appBar(){
    var elementStyle=GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14,color: Colors.black54);
    return Row(children: [
      Expanded(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          children: [
            Text(textAlign: TextAlign.center,"", style: elementStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(textAlign: TextAlign.center,"Syb", style: elementStyle),
                Text(textAlign: TextAlign.center,"Date", style: elementStyle)
              ],
            ),
          ],
        ),
      )),
      Expanded(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          children: [
            Text(textAlign: TextAlign.center,"3M", style: elementStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(textAlign: TextAlign.center,"bid", style: elementStyle),
                Text(textAlign: TextAlign.center,"ask", style: elementStyle)
              ],
            ),
          ],
        ),
      )),
      Expanded(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          children: [
            Text(textAlign: TextAlign.center,"Cash", style: elementStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(textAlign: TextAlign.center,"bid", style: elementStyle),
                Text(textAlign: TextAlign.center,"ask", style: elementStyle)
              ],
            ),
          ],
        ),
      )),


    ],);
  }
}