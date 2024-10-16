import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:market_hub_application/features/plans/widgets/card_slider/ui/card_slider.dart';
import '../widgets/card_index_traker/ui/card_index_traker.dart';

class PlansPage extends StatelessWidget {
  bool isTrial;
   PlansPage({required this.isTrial});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // SizedBox(height: 20,),
              Text(textAlign: TextAlign.center,"Choose Your Plan",style: GoogleFonts.poppins(fontSize: 26,fontWeight: FontWeight.w700,),),
              Text(textAlign: TextAlign.center,"Power Your Market Insights",style: GoogleFonts.poppins(fontSize: 26,fontWeight: FontWeight.w700,),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: CardIndexTraker(),
              ),
              Expanded(child: Align(alignment:Alignment.topCenter,child: CardSlider(isTrial: isTrial))),
            ],
          ),
        ),
      ),
    );
  }
}
