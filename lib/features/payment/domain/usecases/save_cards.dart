import '../../data/models/card_model.dart';
import '../repos/payment_repo.dart';

class SaveCards {
  final PaymentRepo repo;

  SaveCards(this.repo);

  Future<void> call(List<CardModel> cards) {
    return repo.saveCards(cards);
  }
}
