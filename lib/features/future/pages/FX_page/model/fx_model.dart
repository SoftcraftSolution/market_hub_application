class FX_model {
  final String name;
  final String last;
  final String open;
  final String high;
  final String low;
  final String change;
  final String percentChange;
  final String time;

  FX_model({
    required this.name,
    required this.last,
    required this.open,
    required this.high,
    required this.low,
    required this.change,
    required this.percentChange,
    required this.time,
  });

  factory FX_model.fromMap(Map<String, String> map) {
    return FX_model(
      name: map['name']!,
      last: map['last']!,
      open: map['open']!,
      high: map['high']!,
      low: map['low']!,
      change: map['change']!,
      percentChange: map['percentChange']!,
      time: map['time']!,
    );
  }
}
