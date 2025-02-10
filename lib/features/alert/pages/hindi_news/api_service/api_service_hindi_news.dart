import 'package:dio/dio.dart';
import '../../../model/news_feed_model.dart';
import '../../../../../core/api/api_services.dart';

class SelfHindiNewsApiService {
  Future<List<NewsFeedModel>> fetchNews() async {
    try {
      final response = await BaseApiServices.dio.get("https://admin.markethubindia.com/admin/get-hindi-news");
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.data['news'];
        return jsonData.map((newsJson) => NewsFeedModel.fromJson(newsJson)).toList().reversed.toList();
      } else {
        throw Exception('Failed to load Hindi news: ${response.statusCode}');
      }
    } on DioError catch (e) {
      throw Exception('Failed to load Hindi news: ${e.response?.statusCode} ${e.message}');
    }
  }
}
