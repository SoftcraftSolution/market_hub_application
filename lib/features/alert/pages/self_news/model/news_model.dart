// lib/models/news.dart
class SelfNewsModel {
  final String id;
  final String title;
  final String content;
  final String link;
  final String image;
  final DateTime date;

  SelfNewsModel({required this.date,required this.id, required this.title, required this.content, required this.link, required this.image});

  factory SelfNewsModel.fromJson(Map<String, dynamic> json) {
    return SelfNewsModel(
      id: json['_id'],
      title: json['addTitle'],
      content: json['addContent'],
      link: json['addLink'],
      image: json['image'] ?? '', // Handle null images
      date: DateTime.parse(json['createdAt'] as String), // Handle null images
    );
  }
}
