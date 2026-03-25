part of 'get_booking_sessions_cubit.dart';

sealed class GetBookingSessionsState extends Equatable {
  const GetBookingSessionsState();

  @override
  List<Object> get props => [];
}

// Initial State
class GetBookingSessionsInitialState extends GetBookingSessionsState {}

// Get Booked Sessions
final class GetBookingSessionsLoadingState extends GetBookingSessionsState {}

final class GetBookingSessionsSuccessState extends GetBookingSessionsState {
  final List<BookingModel> bookings;
  const GetBookingSessionsSuccessState({required this.bookings});
  @override
  List<Object> get props => [bookings];
}

final class GetBookingSessionsFailureState extends GetBookingSessionsState {
  final String errorMessage;
  const GetBookingSessionsFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

// Cancel Booked Session
final class CancelBookingSessionsLoadingState extends GetBookingSessionsState {}

final class CancelBookingSessionsSuccessState extends GetBookingSessionsState {}

final class CancelBookingSessionsFailureState extends GetBookingSessionsState {
  final String errorMessage;
  const CancelBookingSessionsFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
