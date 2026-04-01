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
  static double getFinalPrice(PaymentTypesModel model) {
    if (model.discount == null) return model.price;

    final discountValue =
        double.tryParse(model.discount!.replaceAll('%', '')) ?? 0;

    final discountAmount = model.price * (discountValue / 100);

    return model.price - discountAmount;
  }
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
