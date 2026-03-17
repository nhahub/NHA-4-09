class PaymentTypesModel {
  final double price;
  final String duration;
  final String? discount;

  const PaymentTypesModel({
    required this.price,
    required this.duration,
    this.discount,
  });
}

const List<PaymentTypesModel> paymentTypes = [
  PaymentTypesModel(price: 60, duration: "month"),
  PaymentTypesModel(price: 280, duration: "year", discount: "20%"),
];
