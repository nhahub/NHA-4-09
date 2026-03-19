part of 'booking_cubit.dart';

class BookingState extends Equatable {
  final TherapistModel therapist;
  final String selectedType;
  final num price;
  final num priceAfterDiscount;

  const BookingState({
    required this.therapist,
    required this.selectedType,
    required this.price,
    required this.priceAfterDiscount,
  });

  factory BookingState.initial({required TherapistModel therapist}) {
    return BookingState(
      therapist: therapist,
      selectedType: 'chat',
      price: therapist.chatPrice,
      priceAfterDiscount: therapist.chatPriceAfterDiscount,
    );
  }

  BookingState copyWith({
    String? selectedType,
    num? price,
    num? priceAfterDiscount,
  }) {
    return BookingState(
      therapist: therapist,
      selectedType: selectedType ?? this.selectedType,
      price: price ?? this.price,
      priceAfterDiscount: priceAfterDiscount ?? this.priceAfterDiscount,
    );
  }

  @override
  List<Object?> get props => [
    therapist,
    selectedType,
    price,
    priceAfterDiscount,
  ];
}
