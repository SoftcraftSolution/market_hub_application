import 'package:flutter/material.dart';
import 'package:market_hub_application/core/constants/color_constant.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCard extends StatelessWidget {
  double cardSize;
   LoadingCard({required this.cardSize});

  @override
  Widget build(BuildContext context) {
    var color=Color(0xFFACADAE);
    return SizedBox(height: cardSize,width: MediaQuery.of(context).size.width*0.9,
      child: Shimmer.fromColors(
        baseColor: Colors.black12,
        highlightColor: Colors.white10,
        child:  Padding(
          padding: const EdgeInsets.symmetric(vertical: 8,),
          child: Container(width:MediaQuery.of(context).size.width,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: color),),
        ),

      ),
    );
  }
}
