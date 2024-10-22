// lib/models/feedback.dart
class Feedback {
  final int rating;
  final String comments;

  Feedback({required this.rating, required this.comments});

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'comments': comments,
    };
  }
}
