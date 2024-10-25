// models/settlement.dart

class Settlement {
  final String id;
  final String symbol;
  final String date;
  final BidAsk threeM;
  final BidAsk cash;

  Settlement({
    required this.id,
    required this.symbol,
    required this.date,
    required this.threeM,
    required this.cash,
  });

  factory Settlement.fromJson(Map<String, dynamic> json) {
    return Settlement(
      id: json['_id'],
      symbol: json['symbol'],
      date: json['date'],
      threeM: BidAsk.fromJson(json['3m']),
      cash: BidAsk.fromJson(json['cash']),
    );
  }
}

class BidAsk {
  final double bid;
  final double ask;

  BidAsk({
    required this.bid,
    required this.ask,
  });

  factory BidAsk.fromJson(Map<String, dynamic> json) {
    return BidAsk(
      bid: json['bid'].toDouble(),
      ask: json['ask'].toDouble(),
    );
  }
}
