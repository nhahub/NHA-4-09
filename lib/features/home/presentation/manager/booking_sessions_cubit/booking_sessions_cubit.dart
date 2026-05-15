import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../therapist/data/models/booking_model.dart';
import '../../../../therapist/data/repos/booking_repo.dart';

part 'booking_sessions_state.dart';

class BookingSessionsCubit extends Cubit<BookingSessionsState> {
  final BookingRepo _bookingRepo;
  BookingSessionsCubit({required BookingRepo bookingRepo})
    : _bookingRepo = bookingRepo,
      super(const BookingSessionsState(status: BookingSessionsStatus.loading));

  Future<void> getBookingSessions() async {
    try {
      final List<BookingModel> bookings = await _bookingRepo
          .getBookingSessions();
      emit(
        state.copyWith(
          status: BookingSessionsStatus.success,
          bookings: bookings,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: BookingSessionsStatus.failure,
          errorMessage: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }

  Future<void> cancelSession({
    required String bookingId,
    required String slotId,
  }) async {
    emit(state.copyWith(status: BookingSessionsStatus.loading));
    try {
      await _bookingRepo.cancelSession(bookingId: bookingId, slotId: slotId);

      final updatedSessions = state.bookings!
          .where((session) => session.id != bookingId)
          .toList();

      emit(
        state.copyWith(
          status: BookingSessionsStatus.success,
          bookings: updatedSessions,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: BookingSessionsStatus.failure,
          errorMessage: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }
}
