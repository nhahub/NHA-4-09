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
  PaymentTypesModel(price: 29.99, duration: "month"),
  PaymentTypesModel(price: 287.90, duration: "year", discount: "20%"),
];
