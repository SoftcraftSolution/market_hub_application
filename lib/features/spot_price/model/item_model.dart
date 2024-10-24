class SpotItem {
  final String id;          // Corresponds to "_id"
  final String city;
  final String category;
  final String type;
  final String subcategory;
  final String price;

  SpotItem({
    required this.id,
    required this.city,
    required this.category,
    required this.type,
    required this.subcategory,
    required this.price,
  });

  // Factory method to create an instance from a JSON map
  factory SpotItem.fromJson(Map<String, dynamic> json) {
    return SpotItem(
      id: json['_id'] as String,
      city: json['city'] as String,
      category: json['category'] as String,
      type: json['type'] as String,
      subcategory: json['subcategory'] as String,
      price: json['price'] as String,
    );
  }

  // Method to convert the instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'city': city,
      'category': category,
      'type': type,
      'subcategory': subcategory,
      'price': price,
    };
  }
}
