part of 'booking_sessions_cubit.dart';

enum BookingSessionsStatus { loading, success, failure }

extension BookingSessionsStatusX on BookingSessionsStatus {
  bool get isLoading => this == BookingSessionsStatus.loading;
  bool get isSuccess => this == BookingSessionsStatus.success;
  bool get isFailure => this == BookingSessionsStatus.failure;
}

class BookingSessionsState extends Equatable {
  final BookingSessionsStatus status;
  final List<BookingModel>? bookings;
  final String? errorMessage;

  const BookingSessionsState({
    this.status = BookingSessionsStatus.loading,
    this.bookings,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [status, bookings, errorMessage];

  BookingSessionsState copyWith({
    BookingSessionsStatus? status,
    List<BookingModel>? bookings,
    String? errorMessage,
  }) {
    return BookingSessionsState(
      status: status ?? this.status,
      bookings: bookings ?? this.bookings,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
