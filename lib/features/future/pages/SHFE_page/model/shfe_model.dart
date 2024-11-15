// lib/price_model.dart

class SHFE_model {

  final String description;
  final String id;
  final String price;
  final String open;
  final String high;
  final String low;
  final String volume;
  final String change;

  SHFE_model({
    required this.description,
    required this.id,
    required this.price,
    required this.open,
    required this.high,
    required this.low,
    required this.volume,
    required this.change,
  });

  factory SHFE_model.fromJson(Map<String, dynamic> json) {
    return SHFE_model(
      id:json["_id"]??"",
      description: json['description'],
      price: json['price'],
      open: json['open'],
      high: json['high'],
      low: json['low'],
      volume: json['volume'],
      change: json['change'],
    );
  }
}
