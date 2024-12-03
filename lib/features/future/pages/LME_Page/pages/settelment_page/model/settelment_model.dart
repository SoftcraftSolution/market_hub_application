class Settlement {
  final String id;
  final String symbol;
  final String date;
  BidAsk threeM; // 3M bid/ask data
  BidAsk cash; // Cash bid/ask data

  Settlement({
    required this.id,
    required this.symbol,
    required this.date,
    required this.threeM,
    required this.cash,
  });

  // Factory method to parse data from the API
  factory Settlement.fromApiJson(Map<String, dynamic> json, String type) {
    final bidAsk = BidAsk(
      bid: json['Bid'].toDouble(),
      ask: json['Ask'].toDouble(),
    );
    return Settlement(
      id: json['_id'],
      symbol: json['Symbol'],
      date: json['Date'],
      threeM: type == '3m' ? bidAsk : BidAsk.empty(),
      cash: type == 'cash' ? bidAsk : BidAsk.empty(),
    );
  }

  // Factory for creating an empty settlement object
  Settlement.empty()
      : id = '',
        symbol = '',
        date = '',
        threeM = BidAsk.empty(),
        cash = BidAsk.empty();
}

class BidAsk {
  final double bid;
  final double ask;

  BidAsk({
    required this.bid,
    required this.ask,
  });

  // Factory for creating empty BidAsk data
  factory BidAsk.empty() => BidAsk(bid: 0.0, ask: 0.0);
}
