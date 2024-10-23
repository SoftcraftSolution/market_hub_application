import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_hub_application/core/utils/utils.dart';
import 'package:share_plus/share_plus.dart';

import '../pages/self_news/model/news_model.dart';
import '../pages/self_news/pages/news_brife_page.dart'; // Adjusted import to match the SelfNewsModel

class NewsItem extends StatelessWidget {
  final SelfNewsModel news; // Accepting the SelfNewsModel as a parameter

  NewsItem({required this.news});



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsBriefScreen(news: news),
          ),
        );
      },
      child: Padding(
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
                        news.title,
                        maxLines: 3,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          // color: Colors.red.withOpacity(0.6),
                        ),
                        child: Center(
                          child: Image.network(
                            news.image,
                            errorBuilder: (BuildContext context, Object error,
                                StackTrace? stackTrace) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(),
                              ); // Path to your default image
                            },
                            fit: BoxFit.cover, // Adjust the fit as necessary
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 18),
                        child: Text(
                          news.content,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              diffFormatDate(news
                                  .date), // Use the custom formatDate function
                              style: GoogleFonts.poppins(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Get the position of the button to define the share position origin
                              RenderBox renderBox =
                                  context.findRenderObject() as RenderBox;
                              Offset position =
                                  renderBox.localToGlobal(Offset.zero);
                              Rect sharePositionOrigin = Rect.fromLTWH(
                                position.dx,
                                position.dy,
                                renderBox.size.width,
                                renderBox.size.height,
                              );

                              // Share the content with position
                              Share.share(
                                "Check out this news: ${news.title}\n\nDownload our app: https://google.com",
                                sharePositionOrigin: sharePositionOrigin,
                              );
                            },
                            child: Icon(
                              Icons.share,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
