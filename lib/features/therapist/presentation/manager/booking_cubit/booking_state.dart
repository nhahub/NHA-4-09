part of 'booking_cubit.dart';

class BookingState extends Equatable {
  final TherapistModel therapist;
  final Map<int, List<TimeSlotModel>> availableSlots;
  final int? selectedDay;
  final TimeSlotModel? selectedSlot;
  final String? selectedType;
  final double price;
  final double priceAfterDiscount;

  const BookingState({
    required this.therapist,
    required this.availableSlots,
    this.selectedDay,
    this.selectedSlot,
    this.selectedType,
    required this.price,
    required this.priceAfterDiscount,
  });

  factory BookingState.initial({required TherapistModel therapist}) {
    return BookingState(
      therapist: therapist,
      availableSlots: const {},
      selectedDay: null,
      selectedSlot: null,
      selectedType: null,
      price: 0,
      priceAfterDiscount: 0,
    );
  }

  BookingState copyWith({
    Map<int, List<TimeSlotModel>>? availableSlots,
    int? selectedDay,
    TimeSlotModel? selectedSlot,
    String? selectedType,
    double? price,
    double? priceAfterDiscount,
  }) {
    return BookingState(
      therapist: therapist,
      availableSlots: availableSlots ?? this.availableSlots,
      selectedDay: selectedDay ?? this.selectedDay,
      selectedSlot: selectedSlot ?? this.selectedSlot,
      selectedType: selectedType ?? this.selectedType,
      price: price ?? this.price,
      priceAfterDiscount: priceAfterDiscount ?? this.priceAfterDiscount,
    );
  }

  @override
  List<Object?> get props => [
    therapist,
    availableSlots,
    selectedDay,
    selectedSlot,
    selectedType,
    price,
    priceAfterDiscount,
  ];
}

class BookingLoadingState extends BookingState {
  const BookingLoadingState({required super.therapist})
    : super(availableSlots: const {}, price: 0, priceAfterDiscount: 0);
}
