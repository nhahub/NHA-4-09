import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../therapist/data/models/booking_model.dart';
import '../../../../therapist/data/repos/booking_repo.dart';

part 'get_booking_sessions_state.dart';

class GetBookingSessionsCubit extends Cubit<GetBookingSessionsState> {
  final BookingRepo bookingRepo;
  GetBookingSessionsCubit({required this.bookingRepo})
    : super(GetBookingSessionsInitialState());

  void getBookingSessions() async {
    emit(GetBookingSessionsLoadingState());
    final Either<Failure, List<BookingModel>> bookings = await bookingRepo
        .getBookingSessions();

    bookings.fold(
      (failure) {
        emit(GetBookingSessionsFailureState(errorMessage: failure.message));
      },
      (bookings) {
        emit(GetBookingSessionsSuccessState(bookings: bookings));
      },
    );
  }

  Future<void> cancelSession({
    required String bookingId,
    required String slotId,
  }) async {
    final Either<Failure, void> response = await bookingRepo.cancelSession(
      bookingId: bookingId,
      slotId: slotId,
    );
    response.fold(
      (failure) {
        emit(CancelBookingSessionsFailureState(errorMessage: failure.message));
      },
      (bookings) {
        getBookingSessions();
        emit(CancelBookingSessionsSuccessState());
      },
    );
  }
}
