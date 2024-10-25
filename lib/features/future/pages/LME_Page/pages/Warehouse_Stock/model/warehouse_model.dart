class LmeStock {
  final String symbol;
  final int open;
  final int close;
  final int live;
  final int cancel;
  final int change;
  final double percentageChange;

  LmeStock({
    required this.symbol,
    required this.open,
    required this.close,
    required this.live,
    required this.cancel,
    required this.change,
    required this.percentageChange,
  });

  factory LmeStock.fromJson(Map<String, dynamic> json) {
    return LmeStock(
      symbol: json['Symbol'],
      open: json['Open'] ?? 0,
      close: json['Close'] ?? 0,
      live: json['Live'] ?? 0,
      cancel: json['Cancel'] ?? 0,
      change: json['Change'] ?? 0,
      percentageChange: double.tryParse(json['% Change'].toString()) ?? 0.0,
    );
  }
}

class LmeWarehouseData {
  final List<LmeStock> lmeStocks;

  LmeWarehouseData({required this.lmeStocks});

  factory LmeWarehouseData.fromJson(Map<String, dynamic> json) {
    return LmeWarehouseData(
      lmeStocks: (json['LME_Warehouse_Stock'] as List)
          .map((data) => LmeStock.fromJson(data))
          .toList(),
    );
  }
}
