class PaymentTypesModel {
  final double price;
  final String duration;
  final String type;
  final String? discount;

  const PaymentTypesModel({
    required this.price,
    required this.type,
    this.discount,
    required this.duration,
  });
}

const List<PaymentTypesModel> paymentTypes = [
  PaymentTypesModel(price: 60, type: "monthly", duration: "month"),
  PaymentTypesModel(
    price: 280,
    type: "yearly",
    discount: "20%",
    duration: "year",
  ),
];
