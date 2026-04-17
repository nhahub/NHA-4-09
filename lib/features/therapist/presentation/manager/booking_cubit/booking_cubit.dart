import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/therapist_model.dart';
import '../../../data/models/time_slot_model.dart';
import '../../../data/repos/availability_repo.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final TherapistModel _therapist;
  final AvailabilityRepo _availabilityRepo;

  BookingCubit({
    required TherapistModel therapist,
    required AvailabilityRepo availabilityRepo,
  }) : _availabilityRepo = availabilityRepo,
       _therapist = therapist,
       super(BookingState.initial(therapist: therapist));

  Future<void> getAvailableSlots() async {
    emit(BookingLoadingState(therapist: _therapist));
    try {
      final Map<int, List<TimeSlotModel>> availableSlots =
          await _availabilityRepo.getTimeSlots(therapistId: _therapist.id);
      emit(state.copyWith(availableSlots: availableSlots));
    } catch (e) {
      emit(state.copyWith(availableSlots: {}));
    }
  }

  void selectDay({required int day}) {
    emit(state.copyWith(selectedDay: day, selectedSlot: null));
  }

  void selectSlot({required TimeSlotModel slot}) {
    emit(state.copyWith(selectedSlot: slot));
  }

  void selectType({required String type}) {
    final price = type == 'chat' ? _therapist.chatPrice : _therapist.livePrice;
    final priceAfterDiscount = type == 'chat'
        ? _therapist.chatPriceAfterDiscount
        : _therapist.livePriceAfterDiscount;

    emit(
      state.copyWith(
        selectedType: type,
        price: price.toDouble(),
        priceAfterDiscount: priceAfterDiscount.toDouble(),
      ),
    );
  }
}
