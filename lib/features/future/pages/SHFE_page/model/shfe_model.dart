// lib/price_model.dart

class SHFE_model {
  final String id;
  final String name;
  final String latestPrice;
  final String highest;
  final String lowest;
  final String riseFall;
  final String updateTime;
  final String yesterdayHarvest;
  final DateTime createdAt;
  final DateTime updatedAt;

  SHFE_model({
    required this.id,
    required this.name,
    required this.latestPrice,
    required this.highest,
    required this.lowest,
    required this.riseFall,
    required this.updateTime,
    required this.yesterdayHarvest,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SHFE_model.fromJson(Map<String, dynamic> json) {
    return SHFE_model(
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
      latestPrice: json["latestPrice"].toString() ?? "0",
      highest: json["highest"].toString() ?? "0",
      lowest: json["lowest"].toString() ?? "0",
      riseFall: json["riseFall"].toString() ?? "0",
      updateTime: json["updateTime"] ?? "",
      yesterdayHarvest: json["yesterdayHarvest"].toString() ?? "0",
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }

  // Optional: Convert the model back to JSON
  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "latestPrice": latestPrice,
      "highest": highest,
      "lowest": lowest,
      "riseFall": riseFall,
      "updateTime": updateTime,
      "yesterdayHarvest": yesterdayHarvest,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
    };
  }
}
