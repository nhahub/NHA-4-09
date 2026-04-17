import 'package:uuid/uuid.dart';

import '../../../../core/functions/user_data_local.dart';
import '../models/booking_model.dart';
import '../services/booking_service.dart';

class BookingRepo {
  final BookingService _bookingService;

  BookingRepo({required BookingService bookingService})
    : _bookingService = bookingService;

  Future<void> bookingSession({
    required BookingTherapist therapist,
    required BookingSlot slot,
    required String sessionType,
    required double price,
  }) async {
    const uuid = Uuid();
    await _bookingService.bookingSession(
      bookingModel: BookingModel(
        id: uuid.v4(),
        userId: getUser()!.userId,
        sessionType: sessionType,
        price: price,
        status: 'confirmed',
        createdAt: DateTime.now(),
        therapistId: therapist.id,
        therapistName: therapist.name,
        therapistSpeciality: therapist.speciality,
        therapistImage: therapist.image,
        slotId: slot.id,
        slotStartTime: slot.startTime,
        slotEndTime: slot.endTime,
      ),
      slotId: slot.id,
    );
  }

  Future<List<BookingModel>> getBookingSessions() async {
    final List<BookingModel> bookings = await _bookingService
        .getBookingSessions();
    return bookings;
  }

  Future<void> cancelSession({
    required String bookingId,
    required String slotId,
  }) async {
    await _bookingService.cancelSession(bookingId: bookingId, slotId: slotId);
  }
}
