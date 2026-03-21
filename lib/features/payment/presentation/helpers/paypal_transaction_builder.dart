import '../../data/models/paybal/amount_details_model.dart';
import '../../data/models/paybal/amount_model.dart';
import '../../data/models/paybal/item_list_model.dart';
import '../../data/models/paybal/item_model.dart';
import '../../data/models/paybal/payment_transaction_model.dart';

PaymentTransactionModel buildPaypalTransaction({
  required double price,
  required String type,
}) {
  return PaymentTransactionModel(
    amount: AmountModel(
      total: price.toStringAsFixed(2),
      currency: "USD",
      details: AmountDetailsModel(
        subtotal: price.toStringAsFixed(2),
        shipping: "0",
        shippingDiscount: 0,
      ),
    ),
    description: "Subscription ($type)",
    itemList: ItemListModel(
      items: [
        ItemModel(
          name: "Subscription",
          quantity: 1,
          price: price.toStringAsFixed(2),
          currency: "USD",
        ),
      ],
    ),
  );
}
