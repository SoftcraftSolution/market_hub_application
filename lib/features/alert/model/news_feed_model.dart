// lib/models/news.dart
class NewsFeedModel {
  final String id;
  final String title;
  final String content;
  final String link;
  final String image;
  final DateTime date;
  final String? pdfUrl;


  NewsFeedModel({this.pdfUrl,required this.date,required this.id, required this.title, required this.content, required this.link, required this.image});

  factory NewsFeedModel.fromJson(Map<String, dynamic> json) {
    return NewsFeedModel(
      pdfUrl: json['pdf'],
      id: json['_id'],
      title: json['addTitle'],
      content: json['addContent'],
      link: json['addLink'] ??'',
      image: json['image'] ?? '', // Handle null images
      date: DateTime.parse(json['createdAt'] as String), // Handle null images
    );
  }
}
