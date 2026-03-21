import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/therapist_model.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final TherapistModel therapist;

  BookingCubit({required this.therapist})
    : super(BookingState.initial(therapist: therapist));

  void selectType(String type) {
    final price = type == 'chat' ? therapist.chatPrice : therapist.livePrice;
    final priceAfterDiscount = type == 'chat'
        ? therapist.chatPriceAfterDiscount
        : therapist.livePriceAfterDiscount;

    emit(
      state.copyWith(
        selectedType: type,
        price: price,
        priceAfterDiscount: priceAfterDiscount,
      ),
    );
  }
}
