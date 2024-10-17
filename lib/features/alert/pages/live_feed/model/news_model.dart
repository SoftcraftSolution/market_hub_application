class NewsModel {
  String title;
  String link;
  String image;
  String description;
  String author;
  String date;

  NewsModel({
    required this.title,
    required this.link,
    required this.image,
    required this.description,
    required this.author,
    required this.date,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] ?? '',
      link: json['link'] ?? '',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      author: json['author'] ?? '',
      date: json['date'] ?? '',
    );
  }
}
