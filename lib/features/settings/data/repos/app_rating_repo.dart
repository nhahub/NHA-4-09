import 'package:dartz/dartz.dart';
import '../models/app_rating_model.dart';
import '../services/app_rating_local_service.dart';
import '../services/app_rating_service.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/networking/api_error_handler.dart';

class AppRatingRepo {
  final AppRatingService appRatingService;
  final AppRatingLocalService appRatingLocalService;

  AppRatingRepo({
    required this.appRatingService,
    required this.appRatingLocalService,
  });

  /// Submit or update rating
  Future<Either<Failure, void>> submitRating({
    required AppRatingModel appRatingModel,
  }) async {
    try {
      await appRatingService.submitRating(appRatingModel: appRatingModel);

      await appRatingLocalService.cacheUserRating(appRatingModel);

      return const Right(null);
    } catch (e) {
      return Left(ApiErrorHandler.handle(error: e));
    }
  }

  /// Get current user rating
  Future<Either<Failure, AppRatingModel?>> getUserRating({
    bool forceRefresh = false,
  }) async {
    try {
      // Try local first
      if (!forceRefresh) {
        final cached = appRatingLocalService.getCachedUserRating();
        if (cached != null) {
          return Right(cached);
        }
      }

      // API call
      final result = await appRatingService.getUserRating();

      // cache result
      if (result != null) {
        await appRatingLocalService.cacheUserRating(result);
      }

      return Right(result);
    } catch (e) {
      return Left(ApiErrorHandler.handle(error: e));
    }
  }
}
