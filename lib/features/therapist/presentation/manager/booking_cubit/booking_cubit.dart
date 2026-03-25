import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/therapist_model.dart';
import '../../../data/models/time_slot_model.dart';
import '../../../data/repos/availability_repo.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final TherapistModel therapist;
  final AvailabilityRepo availabilityRepo;

  BookingCubit({required this.therapist, required this.availabilityRepo})
    : super(BookingState.initial(therapist: therapist));

  Future<void> getAvailableSlots() async {
    emit(BookingLoadingState(therapist: therapist));
    final Either<Failure, Map<int, List<TimeSlotModel>>> result =
        await availabilityRepo.getTimeSlots(therapistId: therapist.id);

    result.fold(
      (failure) {
        emit(state.copyWith(availableSlots: {}));
      },
      (slotsByDay) {
        emit(state.copyWith(availableSlots: slotsByDay));
      },
    );
  }

  void selectDay({required int day}) {
    emit(state.copyWith(selectedDay: day, selectedSlot: null));
  }

  void selectSlot({required TimeSlotModel slot}) {
    emit(state.copyWith(selectedSlot: slot));
  }

  void selectType({required String type}) {
    final price = type == 'chat' ? therapist.chatPrice : therapist.livePrice;
    final priceAfterDiscount = type == 'chat'
        ? therapist.chatPriceAfterDiscount
        : therapist.livePriceAfterDiscount;

    emit(
      state.copyWith(
        selectedType: type,
        price: price.toDouble(),
        priceAfterDiscount: priceAfterDiscount.toDouble(),
      ),
    );
  }
}
