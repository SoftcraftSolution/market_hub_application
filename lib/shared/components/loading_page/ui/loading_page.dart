import 'package:flutter/material.dart';

import '../widget/loading_card.dart';



class LoadingPage extends StatelessWidget {
  double  cardSize;
   LoadingPage({ this.cardSize=150});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(padding:EdgeInsets.all(0),itemBuilder: (conext,index)=>LoadingCard(cardSize: cardSize,),itemCount: 6,);
  }
}
