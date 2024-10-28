class SpotItem {
  final String id;                // Corresponds to "_id"
  final String city;
  final String category;
  final String type;
  final String subcategory;
  final String price;
  final String incrementPrice;    // New field
  final String lastPrice;         // New field
  final String percentageChange;   // New field
  final DateTime createdAt;       // New field
  final DateTime updatedAt;

  // New field

  SpotItem({
    required this.id,
    required this.city,
    required this.category,
    required this.type,
    required this.subcategory,
    required this.price,
    required this.incrementPrice,  // New parameter
    required this.lastPrice,       // New parameter
    required this.percentageChange, // New parameter
    required this.createdAt,       // New parameter
    required this.updatedAt,
    // New parameter
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
      incrementPrice: json['incrementPrice'] as String,  // New field
      lastPrice: json['lastPrice'] as String,            // New field
      percentageChange: json['percentageChange'] as String, // New field
      createdAt: DateTime.parse(json['createdAt'] as String), // New field
      updatedAt: DateTime.parse(json['updatedAt'] as String), // New field
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
      'incrementPrice': incrementPrice,  // New field
      'lastPrice': lastPrice,              // New field
      'percentageChange': percentageChange, // New field
      'createdAt': createdAt.toIso8601String(), // New field
      'updatedAt': updatedAt.toIso8601String(), // New field
    };
  }
}
