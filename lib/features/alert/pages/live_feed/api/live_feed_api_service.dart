import 'package:dio/dio.dart';
import 'package:html/parser.dart';
import 'package:market_hub_application/core/api/api_services.dart';

class LiveFeedApiService {
  // Future<List<Map<String, String>>> fetchNews() async {
  //   try {
  //     // Create Dio instance
  //     final url = 'https://www.forexlive.com/';
  //
  //     // Make HTTP GET request using Dio
  //     final response = await BaseApiServices.dio.get(url);
  //
  //     // Check if the response is successful
  //     if (response.statusCode == 200) {
  //       final document = parse(response.data); // Parse the HTML response
  //
  //       List<Map<String, String>> articles = [];
  //
  //       // Extract article data from the parsed HTML
  //       document.querySelectorAll('.article-slot__wrapper').forEach((element) {
  //         final titleElement = element.querySelector('h3.article-slot__title a');
  //         final title = titleElement?.text.trim() ?? '';
  //         final link = titleElement?.attributes['href'] ?? '';
  //         final image = element.querySelector('img')?.attributes['src'] ?? '';
  //         final tldr = element.querySelector('ul.tldr li')?.text.trim() ?? 'No description available';
  //         final author = element.querySelector('.publisher-details__publisher-name')?.text.trim() ?? '';
  //         final date = element.querySelector('.publisher-details__date')?.text.trim() ?? '';
  //
  //         if (title.isNotEmpty && link.isNotEmpty && image.isNotEmpty) {
  //           articles.add({
  //             'title': title,
  //             'link': 'https://www.forexlive.com$link',
  //             'image': image,
  //             'description': tldr,
  //             'author': author,
  //             'date': date,
  //           });
  //         }
  //       });
  //
  //       return articles;
  //     } else {
  //       throw Exception('Failed to load ForexLive data');
  //     }
  //   } catch (error) {
  //     print('Error scraping ForexLive: $error');
  //     return [];
  //   }
  // }
  Future<List<dynamic>> fetchNews() async {
    const String url = 'https://rss.app/feeds/v1.1/2Cwgc09Wh8yPDuiw.json';
    try {
      final response = await BaseApiServices.dio.get(url);
      if (response.statusCode == 200) {
        return response.data['items'];
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}




