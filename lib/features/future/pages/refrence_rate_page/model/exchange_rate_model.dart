// lib/models/exchange_rate.dart

class ExchangeRate {
  final String date;
  final String? below10L; // Optional for RBI TT
  final String? above10L; // Optional for SBI TT
  final String? rbiFbill; // Optional for RBI TT

  ExchangeRate({
    required this.date,
    this.below10L,
    this.above10L,
    this.rbiFbill,
  });

  factory ExchangeRate.fromSbiJson(Map<String, dynamic> json) {
    return ExchangeRate(
      date: json['SBI TT'],
      below10L: json['BELOW 10 L'],
      above10L: json['ABOVE 10 L'],
    );
  }

  factory ExchangeRate.fromRbiJson(Map<String, dynamic> json) {
    return ExchangeRate(
      date: json['RBI FBILL'],
      rbiFbill: json['Column2'],
    );
  }
}
