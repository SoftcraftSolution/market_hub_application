class FXModel {
  final String currencyPair;
  final String rate;

  FXModel({
    required this.currencyPair,
    required this.rate,
  });

  factory FXModel.fromMap(Map<String, dynamic> map) {
    return FXModel(
      currencyPair: map['currencyPair']!,
      rate: map['rate']!,
    );
  }
}
