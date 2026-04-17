import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../therapist/data/models/booking_model.dart';
import '../../../../therapist/data/repos/booking_repo.dart';

part 'get_booking_sessions_state.dart';

class GetBookingSessionsCubit extends Cubit<GetBookingSessionsState> {
  final BookingRepo _bookingRepo;
  GetBookingSessionsCubit({required BookingRepo bookingRepo})
    : _bookingRepo = bookingRepo,
      super(GetBookingSessionsInitialState());

  Future<void> getBookingSessions() async {
    emit(GetBookingSessionsLoadingState());
    
    try {
      final List<BookingModel> bookings = await _bookingRepo
          .getBookingSessions();
      emit(GetBookingSessionsSuccessState(bookings: bookings));
    } catch (e) {
      emit(
        GetBookingSessionsFailureState(
          errorMessage: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }

  Future<void> cancelSession({
    required String bookingId,
    required String slotId,
  }) async {
    emit(CancelBookingSessionsLoadingState());
    try {
      await _bookingRepo.cancelSession(bookingId: bookingId, slotId: slotId);
      await getBookingSessions();
      emit(CancelBookingSessionsSuccessState());
    } catch (e) {
      emit(
        CancelBookingSessionsFailureState(
          errorMessage: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }
}
