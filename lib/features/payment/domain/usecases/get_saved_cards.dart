import '../../data/models/card_model.dart';
import '../repos/payment_repo.dart';

class GetSavedCards {
  final PaymentRepo repo;

  GetSavedCards(this.repo);

  Future<List<CardModel>> call() {
    return repo.getSavedCards();
  }
}
