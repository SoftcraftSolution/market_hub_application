class FXModel {
  final String id;
  final String symbol;
  final String change;
  final String changePercentage;
  final String price;
  final DateTime createdAt;
  final DateTime updatedAt;

  FXModel({
    required this.id,
    required this.symbol,
    required this.change,
    required this.changePercentage,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FXModel.fromMap(Map<String, dynamic> map) {
    return FXModel(
      id: map['_id'],
      symbol: map['symbol'],
      change: map['change'],
      changePercentage: map['changePercentage'],
      price: map['price'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }
}
