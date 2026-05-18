import '../manager/payment_cubit/payment_state.dart';

class SubscribeMapper {
  static SubscribeData map(PaymentState state) {
    if (state is PaymentUpdatedState) {
      return SubscribeData(
        selectedMethodIndex: state.selectedMethodIndex,
        selectedSavedCardIndex: state.selectedSavedCardIndex,
      );
    }
    return SubscribeData.initial();
  }
}

class SubscribeData {
  final int selectedMethodIndex;
  final int selectedSavedCardIndex;

  SubscribeData({
    required this.selectedMethodIndex,
    required this.selectedSavedCardIndex,
  });

  factory SubscribeData.initial() {
    return SubscribeData(selectedMethodIndex: -1, selectedSavedCardIndex: -1);
  }
}
