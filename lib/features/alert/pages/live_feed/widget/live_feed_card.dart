import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/news_model.dart';

class LiveFeedNewsCard extends StatelessWidget {
  final LiveNewsModel newsItem;

  const LiveFeedNewsCard({required this.newsItem});
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launchUrl(newsItem.link),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.network(newsItem.image,
                    height: 150, width: double.infinity, fit: BoxFit.cover)),
            SizedBox(height: 10),
            Text(
              newsItem.title,
              style:
                  GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              newsItem.description,
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  textAlign: TextAlign.end,
                  'By: ${newsItem.author}',
                  style:
                      GoogleFonts.poppins(fontSize: 12, color: Colors.grey[500]),
                ),

              ],
            ),
            Divider()

          ],
        ),
      ),
    );
  }
}
