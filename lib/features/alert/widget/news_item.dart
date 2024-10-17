import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsItem extends StatelessWidget {
  String title;
  String subTitle;
  String img;
  String time;

  NewsItem(
      {required this.img,
        required this.subTitle,
        required this.title,
        required this.time});
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 170,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: Text(
                        maxLines: 3,
                        title,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(16),color: Colors.grey.withOpacity(0.6)),child: Center(),))
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(flex: 4, child: Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: Text(
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      subTitle,
                      style: GoogleFonts.poppins(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  )),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              time,
                              style: GoogleFonts.poppins(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Icon(
                            Icons.share,
                            size: 28,
                          )
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}