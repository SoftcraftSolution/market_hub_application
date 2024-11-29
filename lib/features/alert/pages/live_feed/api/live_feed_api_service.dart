// import 'package:dio/dio.dart';
// import 'package:html/parser.dart';
// import 'package:market_hub_application/core/api/api_services.dart';

// class LiveFeedApiService {
//
//   Future<List<dynamic>> fetchNews() async {
//     const String url = 'https://rss.app/feeds/v1.1/qCS4s2Kyyy1QVyAl.json';
//     try {
//       final response = await BaseApiServices.dio.get(url);
//       if (response.statusCode == 200) {
//         return response.data['items'];
//       } else {
//         throw Exception('Failed to load news');
//       }
//     } catch (e) {
//       print('Error: $e');
//       return [];
//     }
//   }
// }

import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';
import '../model/news_model.dart';


class LiveFeedApiService {
  final String rssFeedUrl = 'https://www.thehindubusinessline.com/markets/commodities/?service=rss';

  /// Fetches and parses RSS feed data into a list of `LiveNewsModel`.
  Future<List<LiveNewsModel>> fetchNews() async {
    try {
      final response = await http.get(Uri.parse(rssFeedUrl));

      if (response.statusCode == 200) {
        // Parse the RSS feed
        final document = XmlDocument.parse(response.body);
        final items = document.findAllElements('item');

        // Map the RSS feed items to LiveNewsModel
        return items.map((item) {
          final title = item.findElements('title').single.text.trim();
          final link = item.findElements('link').single.text.trim();
          final description = item.findElements('description').single.text.trim();
          final pubDate = item.findElements('pubDate').single.text.trim();
          final imageUrl = item
              .findElements('media:content')
              .map((e) => e.getAttribute('url'))
              .firstWhere((url) => url != null, orElse: () => '');

          return LiveNewsModel(
            title: title,
            link: link,
            image: imageUrl ?? '',
            description: description,
            author: 'Unknown', // Author is not available in this RSS feed
            date: pubDate,
          );
        }).toList();
      } else {
        throw Exception('Failed to load RSS feed. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching RSS feed: $e');
      return [];
    }
  }
}





