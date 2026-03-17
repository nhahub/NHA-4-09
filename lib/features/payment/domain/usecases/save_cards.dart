import 'package:moodly/features/payment/data/models/card_model.dart';
import 'package:moodly/features/payment/domain/repos/payment_repo.dart';

class SaveCards {
  final PaymentRepo repo;

  SaveCards(this.repo);

  Future<void> call(List<CardModel> cards) {
    return repo.saveCards(cards);
  }
}
