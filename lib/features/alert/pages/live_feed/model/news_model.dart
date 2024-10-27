class LiveNewsModel {
  String title;
  String link;
  String image;
  String description;
  String author;
  String date;

  LiveNewsModel({
    required this.title,
    required this.link,
    required this.image,
    required this.description,
    required this.author,
    required this.date,
  });

  factory LiveNewsModel.fromJson(Map<String, dynamic> json) {
    return LiveNewsModel(
      title: json['title'] ?? '',
      link: json['url'] ?? '',
      image: json['image'] ?? '',
      description: json['content_text'] ?? '',
      author: json['authors'].isNotEmpty ? json['authors'][0]['name'] : 'Unknown',
      date: json['date_published'] ?? '',
    );
  }
}
