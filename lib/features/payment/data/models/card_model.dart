import 'dart:convert';

class CardModel {
  final String holderName;
  final String cardNumber;
  final String expiryDate;
  final String cvv;

  CardModel({
    required this.holderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
  });

  String get maskedNumber {
    if (cardNumber.length < 4) return cardNumber;
    return ".... .... .... ${cardNumber.substring(cardNumber.length - 4).trim()}";
  }

  Map<String, dynamic> toJson() {
    return {
      'holderName': holderName,
      'cardNumber': cardNumber,
      'expiryDate': expiryDate,
      'cvv': cvv,
    };
  }

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      holderName: json['holderName'],
      cardNumber: json['cardNumber'],
      expiryDate: json['expiryDate'],
      cvv: json['cvv'],
    );
  }

  static String encode(List<CardModel> cards) => json.encode(
    cards.map<Map<String, dynamic>>((card) => card.toJson()).toList(),
  );

  static List<CardModel> decode(String cards) =>
      (json.decode(cards) as List<dynamic>)
          .map<CardModel>((item) => CardModel.fromJson(item))
          .toList();
}
