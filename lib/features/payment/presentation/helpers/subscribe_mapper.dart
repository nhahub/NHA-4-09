import '../../data/models/card_model.dart';
import '../manager/payment_cubit/payment_state.dart';

class SubscribeMapper {
  static SubscribeData map(PaymentState state) {
    if (state is PaymentUpdatedState) {
      return SubscribeData(
        savedCards: state.savedCards,
        selectedMethodIndex: state.selectedMethodIndex,
        selectedSavedCardIndex: state.selectedSavedCardIndex,
      );
    }
    return SubscribeData.initial();
  }

  static CardModel? getCurrentCard(SubscribeData data) {
    if (data.selectedMethodIndex == 3 &&
        data.selectedSavedCardIndex != -1 &&
        data.savedCards.length > data.selectedSavedCardIndex) {
      return data.savedCards[data.selectedSavedCardIndex];
    }
    return null;
  }
}

class SubscribeData {
  final List<CardModel> savedCards;
  final int selectedMethodIndex;
  final int selectedSavedCardIndex;

  SubscribeData({
    required this.savedCards,
    required this.selectedMethodIndex,
    required this.selectedSavedCardIndex,
  });

  factory SubscribeData.initial() {
    return SubscribeData(
      savedCards: [],
      selectedMethodIndex: -1,
      selectedSavedCardIndex: -1,
    );
  }
}
