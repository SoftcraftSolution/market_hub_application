// lib/models/home_update.dart
class HomeUpdate {
  final String id;
  final String? text;
  final String? image;
  final String? imageBase64;
  final DateTime createdAt;

  HomeUpdate({
    required this.id,
     this.text,
    this.image,
    this.imageBase64,
    required this.createdAt,
  });

  factory HomeUpdate.fromJson(Map<String, dynamic> json) {
    return HomeUpdate(
      id: json['_id'],
      text: json['text'] ?? 'No Text',
      image: json['image']?? null,
      imageBase64: json["imageBase64"]?? null,
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
