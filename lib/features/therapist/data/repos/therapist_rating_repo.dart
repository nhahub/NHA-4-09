import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/helpers/logger.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../models/therapist_rating_model.dart';
import '../services/therapist_rating_service.dart';

class TherapistRatingRepo {
  final TherapistRatingService therapistRatingService;

  TherapistRatingRepo({required this.therapistRatingService});

  Future<Either<Failure, List<TherapistRatingModel>>> getRatings({
    required String therapistId,
  }) async {
    try {
      final data = await therapistRatingService.getRatings(
        therapistId: therapistId,
      );

      final ratings = data
          .map((e) => TherapistRatingModel.fromJson(e))
          .toList();

      return right(ratings);
    } catch (e) {
      Logger.log(e.toString());

      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, void>> addRating({
    required TherapistRatingModel rating,
  }) async {
    try {
      await therapistRatingService.addRating(data: rating.toJson());
      return right(null);
    } catch (e) {
      Logger.log(e.toString());
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Stream<Either<Failure, List<TherapistRatingModel>>> listenToRatings({
    required String therapistId,
  }) {
    return therapistRatingService.listenToRatings(therapistId: therapistId).map(
      (data) {
        try {
          final ratings = data
              .map((e) => TherapistRatingModel.fromJson(e))
              .toList();

          return right<Failure, List<TherapistRatingModel>>(ratings);
        } catch (e) {
          Logger.log(e.toString());
          return left(ApiErrorHandler.handle(error: e));
        }
      },
    );
  }

  Future<Either<Failure, Map<String, dynamic>>> getRatingSummary(
    String therapistId,
  ) async {
    try {
      final data = await therapistRatingService.getRatingSummary(therapistId);
      return right(data);
    } catch (e) {
      Logger.log(e.toString());
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}
