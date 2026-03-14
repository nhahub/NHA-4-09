import 'package:dartz/dartz.dart';
import 'package:moodly/core/helpers/logger.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../models/therapist_review_model.dart';
import '../services/therapist_reviews_service.dart';

class TherapistReviewsRepo {
  final TherapistReviewsService therapistReviewsService;

  TherapistReviewsRepo({required this.therapistReviewsService});

  Future<Either<Failure, List<TherapistReviewModel>>> getReviews({
    required String therapistId,
  }) async {
    try {
      final data = await therapistReviewsService.getReviews(
        therapistId: therapistId,
      );

      final ratings = data
          .map((e) => TherapistReviewModel.fromJson(e))
          .toList();

      return right(ratings);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, void>> addReview({
    required TherapistReviewModel rating,
  }) async {
    try {
      await therapistReviewsService.addReview(data: rating.toJson());
      return right(null);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, void>> updateReview({
    required TherapistReviewModel therapistReviewModel,
  }) async {
    try {
      await therapistReviewsService.updateReview(
        ratingId: therapistReviewModel.id,
        updatedData: therapistReviewModel.toJson(),
      );
      return right(null);
    } catch (e) {
      Logger.log(e.toString());
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, void>> deleteReview({required String ratingId}) async {
    try {
      await therapistReviewsService.deleteReview(ratingId: ratingId);
      return right(null);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}
