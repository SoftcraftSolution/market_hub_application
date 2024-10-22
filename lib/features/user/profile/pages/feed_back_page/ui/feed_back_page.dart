
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/shared/widget/button/custom_button.dart';


import '../controller/feedbackCon.dart';

class FeedbackFormPage extends StatelessWidget {
  FeedbackFormPage({super.key});
  ScrollController scrollController = ScrollController();
  var controller = Get.put(FeedbackController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
        appBar: AppBar(backgroundColor: ColorConstants.backgroundColor,title: Text('Feedback Form',style: GoogleFonts.poppins(fontWeight: FontWeight.w700),),centerTitle: true,),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      Column(crossAxisAlignment:CrossAxisAlignment.center,children: [
                        Text(textAlign: TextAlign.center,"How satisfied are you with your overall experience on Market Hub?",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500),),
                        // Text("experience on Market Hub?",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w600)),
                      ],),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 20),
                        child: Obx(() =>  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) {
                            return IconButton(
                              icon: Icon(
                                index <= controller.rating.value ? Icons.star_rate_rounded : Icons.star_border_rounded,
                                color: Colors.amber,
                                size: 58,
                              ),

                              onPressed: () => controller.setRating(index),
                            );
                          }),
                        )

                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize:MainAxisSize.min ,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    "What should we improve?",
                                    style:
                                    GoogleFonts.poppins(fontSize:20,color: Color(0xFF3E4958)),
                                  ),
                                ),
                                SizedBox(height: 30,),
                                Obx(
                                      () => Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          controller
                                              .setFeedBackValue("Punctual");
                                        },
                                        child: Container(
                                          height: 70,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(6),
                                              border: Border.all(
                                                  color: controller
                                                      .feedBackValue
                                                      .value ==
                                                      "Punctual"
                                                      ? ColorConstants.primeryColor
                                                      : Color(0xFFD9D9D9))),
                                          child: Center(
                                            child: Text(
                                              "Punctual",
                                              style: TextStyle(
                                                  color: controller
                                                      .feedBackValue
                                                      .value ==
                                                      "Punctual"
                                                      ? ColorConstants.primeryColor
                                                      : Color(0xFF777B80)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          controller.setFeedBackValue(
                                              "Professional");
                                        },
                                        child: Container(
                                          height: 70,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(6),
                                              border: Border.all(
                                                  color: controller
                                                      .feedBackValue
                                                      .value ==
                                                      "Professional"?
                                                  ColorConstants.primeryColor
                                                      : Color(0xFFD9D9D9))),
                                          child: Center(
                                            child: Text(
                                              "Professional",
                                              style: TextStyle(
                                                  color: controller
                                                      .feedBackValue
                                                      .value ==
                                                      "Professional"
                                                      ?ColorConstants.primeryColor
                                                      : Color(0xFF777B80)),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Obx(
                                      () => Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          controller
                                              .setFeedBackValue("Efficient");
                                        },
                                        child: Container(
                                          height: 70,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(6),
                                              border: Border.all(
                                                  color: controller
                                                      .feedBackValue
                                                      .value ==
                                                      "Efficient"
                                                      ? ColorConstants.primeryColor
                                                      : Color(0xFFD9D9D9))),
                                          child: Center(
                                            child: Text(
                                              "Efficient",
                                              style: TextStyle(
                                                  color: controller
                                                      .feedBackValue
                                                      .value ==
                                                      "Efficient"
                                                      ? ColorConstants.primeryColor
                                                      : Color(0xFF777B80)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          controller
                                              .setFeedBackValue("Others");
                                        },
                                        child: Container(
                                          height: 70,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(6),
                                              border: Border.all(
                                                  color: controller
                                                      .feedBackValue
                                                      .value ==
                                                      "Others"
                                                      ? ColorConstants.primeryColor
                                                      : Color(0xFFD9D9D9))),
                                          child: Center(
                                            child: Text(
                                              "Others",
                                              style: TextStyle(
                                                  color: controller
                                                      .feedBackValue
                                                      .value ==
                                                      "Others"
                                                      ? ColorConstants.primeryColor
                                                      : Color(0xFF777B80)),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Obx(
                            () => controller.feedBackValue.value == "Others"
                            ? Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 14),
                          child: TextFormField(
                              onTap: () {
                                scrollController.animateTo(
                                  scrollController
                                      .position.maxScrollExtent,
                                  duration:
                                  Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                              minLines: 3,
                              maxLines: 3,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(
                                        10)),
                                hintText: "Write review",
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorConstants.primeryColor,
                                      width: 2),
                                  borderRadius:
                                  BorderRadius.circular(10.0),

                                  // Set your desired corner radius
                                ),
                              )),
                        )
                            : Text(""),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                          title: "Submit",
                          onPress: onPress),

                    ],
                  )),
            ],
          ),
        ));
  }
  Future<void> onPress() async {
    Get.snackbar('Success', 'Feedback submitted successfully!',
        snackPosition: SnackPosition.TOP);
    // var con = Get.find<RideController>();
    // var reqData = con.requestData.value;
    // try{
    //   if (controller.feedBackValue.value ==
    //       "Others") {
    //     await Api.sendfeedBack(
    //         reqData["requestId"].toString(),
    //         reqData["driverPhoneNumber"].toString(),
    //         controller.rating.value.toString(),
    //         controller.otherFeedBack.value
    //             .toString());
    //   } else {
    //     await Api.sendfeedBack(
    //         reqData["requestId"].toString(),
    //         reqData["driverPhoneNumber"].toString(),
    //         controller.rating.value.toString(),
    //         controller.feedBackValue.value
    //             .toString());
    //   }
    //   Print.p("afteer sending feedback");
    //   Get.find<RideController>().reinitializeController();
    //   //
    //   Get.find<PositionController>().reinitializeController();
    //   Get.to(MapScreen());
    // }catch(x)
    // {
    //   toast(msg: "there is some issuse2423423");
    // }
  }

}
