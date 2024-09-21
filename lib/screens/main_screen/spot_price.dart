import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/utility/theme.dart';

class SpotPricePage extends StatelessWidget {
  SpotPricePage({super.key});
  var con = Get.put(SpotPriceCon());
  @override
  Widget build(BuildContext context) {
    var elements = ["Base Metal", 'BME (Bombay Metal Exchange)'];
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppTheme.backgroundColor,
            body: Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 40,
                    child:  ListView.builder(
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              con.setPageIndex(index);
                            },
                            child: Obx(
                              ()=> Padding(
                                padding:  index==0?EdgeInsets.only(right: 10):EdgeInsets.zero,
                                child: Container(
                                  decoration: BoxDecoration(border: con.index.value == index?Border(bottom: BorderSide(width:4,color: AppTheme.primeryColor)):null),
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    elements[index],
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: con.index.value == index
                                            ? AppTheme.primeryColor
                                            : Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: elements.length,
                      ),

                  ),
                  Expanded(child: Placeholder(),)
                ],
              ),
            )));
  }
}

class SpotPriceCon extends GetxController {
  RxInt index = 0.obs;
  void setPageIndex(int newValue) {
    index.value = newValue;
  }
}

class MaterialComponent extends StatelessWidget{
  String name;
  String img;
  MaterialComponent({this.name="",this.img=""});

  Widget build(BuildContext context){
    return SizedBox(height: 100,width: 100,child: Placeholder(),);
  }

}
