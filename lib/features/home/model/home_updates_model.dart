// lib/models/home_update.dart
class HomeUpdate {
  final String id;
  final String text;
  final String? image;
  final DateTime createdAt;

  HomeUpdate({
    required this.id,
    required this.text,
    this.image,
    required this.createdAt,
  });

  factory HomeUpdate.fromJson(Map<String, dynamic> json) {
    return HomeUpdate(
      id: json['_id'],
      text: json['text'] ?? 'No Text',
      image: json['image'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
