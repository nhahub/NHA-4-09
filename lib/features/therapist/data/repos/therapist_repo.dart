import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/helpers/logger.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../models/therapist_model.dart';
import '../services/therapist_service.dart';

class TherapistRepo {
  final TherapistService therapistService;

  TherapistRepo({required this.therapistService});

  Future<Either<Failure, List<TherapistModel>>> getTherapists() async {
    try {
      final List<TherapistModel> therapists = await therapistService
          .getTherapists();

      return right(therapists);
    } catch (e) {
      Logger.log(e.toString());
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}
