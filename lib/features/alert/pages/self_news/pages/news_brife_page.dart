import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/utils.dart';
import '../model/news_model.dart';

class NewsBriefScreen extends StatelessWidget {
  final SelfNewsModel news;

  NewsBriefScreen({required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news.title,
              style: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              diffFormatDate(news.date),
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 16),
            Center(
              child: Image.network(
                news.image,
                errorBuilder: (context, error, stackTrace) {
                  return  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(),
                  );
                },
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Text(
                news.content,
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
     
          ],
        ),
      ),
    );
  }


}
