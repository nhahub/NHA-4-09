import 'package:dartz/dartz.dart';
import 'package:moodly/core/errors/failure.dart';
import 'package:moodly/features/therapist/data/services/availability_service.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../models/time_slot_model.dart';

class AvailabilityRepo {
  final AvailabilityService availabilityService;

  AvailabilityRepo({required this.availabilityService});

  Future<Either<Failure, Map<int, List<TimeSlotModel>>>> getTimeSlots({
    required String therapistId,
  }) async {
    try {
      final slotsByDay = await availabilityService.getTimeSlots(
        therapistId: therapistId,
      );
      return right(slotsByDay);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}
