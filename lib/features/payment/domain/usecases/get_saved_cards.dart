import 'package:moodly/features/payment/data/models/card_model.dart';
import 'package:moodly/features/payment/domain/repos/payment_repo.dart';

class GetSavedCards {
  final PaymentRepo repo;

  GetSavedCards(this.repo);

  Future<List<CardModel>> call() {
    return repo.getSavedCards();
  }
}
