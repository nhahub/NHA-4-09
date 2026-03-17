import 'package:moodly/core/services/cache_helper.dart';
import '../../../../core/constants/constants.dart';
import '../models/card_model.dart';

class CardsLocalService {
  static const _key = kSavedCards;

  Future<List<CardModel>> getSavedCards() async {
    final json = CacheHelper.getString(key: _key);

    if (json != null && json.isNotEmpty) {
      return CardModel.decode(json);
    }
    return [];
  }

  Future<void> saveCards(List<CardModel> cards) async {
    final json = CardModel.encode(cards);

    await CacheHelper.set(key: _key, value: json);
  }

  Future<void> clearCards() async {
    await CacheHelper.delete(key: _key);
  }
}
