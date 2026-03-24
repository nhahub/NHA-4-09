import 'package:dartz/dartz.dart';
import 'package:moodly/core/errors/failure.dart';
import 'package:moodly/core/functions/get_user.dart';
import 'package:moodly/core/networking/api_error_handler.dart';
import 'package:moodly/features/therapist/data/models/booking_model.dart';
import 'package:moodly/features/therapist/data/services/booking_service.dart';
import 'package:uuid/uuid.dart';

class BookingRepo {
  final BookingService bookingService;

  BookingRepo({required this.bookingService});

  Future<Either<Failure, void>> bookingSession({
    required String therapistId,
    required String slotId,
    required String sessionType,
    required double price,
  }) async {
    try {
      const uuid = Uuid();
      await bookingService.bookingSession(
        bookingModel: BookingModel(
          id: uuid.v4(),
          userId: getUser()!.userId,
          therapistId: therapistId,
          slotId: slotId,
          sessionType: sessionType,
          price: price,
          status: 'confirmed',
          createdAt: DateTime.now(),
        ),
        slotId: slotId,
      );

      return right(null);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}
