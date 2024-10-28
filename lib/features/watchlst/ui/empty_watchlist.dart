import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyWatchlist extends StatelessWidget {
  const EmptyWatchlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        SizedBox(height:160,child: Image.asset("assets/img/emptyWatch.png")),
          // SizedBox(height: ,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(textAlign: TextAlign.center,"Effortlessly track your favorites by adding them to your watchlist for quick access!",style: GoogleFonts.poppins(fontSize: 14),),
          )
      ],),
    );
  }
}
