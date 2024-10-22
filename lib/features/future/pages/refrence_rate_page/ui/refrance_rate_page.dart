import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_hub_application/features/future/pages/refrence_rate_page/controller/refrenceCon.dart';
import 'package:market_hub_application/features/future/pages/refrence_rate_page/pages/RBI%20TT%20page/rbi_tt_page.dart';
import 'package:market_hub_application/features/future/pages/refrence_rate_page/pages/SBI%20TT%20Page/sbi_tt_page.dart';
import 'package:market_hub_application/shared/components/test_screen.dart';
import 'package:market_hub_application/shared/widget/bottom_sheet/categ_bottom_sheet/ui/categ_bottom_sheet.dart';

import '../../../../../core/constants/color_constant.dart';
import '../../../../../shared/widget/optionBar/list_option_without_border.dart';

class RefRatePage extends StatelessWidget {
   RefRatePage({super.key});
   var con=Get.put(RefRatePageCon());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return CategBottomSheet(elements: ["SBI TT","FBILL"],controller: con,);
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
                        child: ListOptionWithoutBorder(elements: [
                          "SBI TT",
                          "FBILL"
                        ], onIndexChanged: RefRatePageIndexChange().onIndexChange,controller: con,)),
                  ],
                ),
              ),
              Expanded(
                flex: 12,
                child:
                Obx(() =>con.pageIndex.value==0?SbiTtPage():RBITTScreen()
                ),
              ),
            ],
          )),
    );
  }
}
