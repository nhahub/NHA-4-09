// import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/networking/api_error_handler.dart';
import '../../../data/models/therapist_review_model.dart';
import '../../../data/repos/therapist_reviews_repo.dart';
import '../../../domain/functions/create_review_model.dart';
import '../../../domain/functions/review_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'therapist_reviews_state.dart';

part 'therapist_reviews_cubit.freezed.dart'; 


class TherapistReviewsCubit extends Cubit<TherapistReviewsState> {
  final TherapistReviewsRepo _therapistRatingRepo;

  TherapistReviewsCubit({required TherapistReviewsRepo therapistRatingRepo})
    : _therapistRatingRepo = therapistRatingRepo,
      super(
        const TherapistReviewsState(status: TherapistReviewsStatus.initial),
      );

  Future<void> getReviews({required String therapistId}) async {
    emit(state.copyWith(status: TherapistReviewsStatus.loading));

    try {
      final List<TherapistReviewModel> reviews = await _therapistRatingRepo
          .getReviews(therapistId: therapistId);
      emit(
        state.copyWith(
          status: TherapistReviewsStatus.success,
          reviews: reviews,
          average: calculateAverageRating(reviews),
          totalCount: reviews.length,
          userRating: state.userRating,
          hasUserRated: hasUserRated(reviews),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TherapistReviewsStatus.failure,
          error: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }

  Future<void> addReview({
    required String therapistId,
    required String review,
  }) async {
    emit(state.copyWith(status: TherapistReviewsStatus.loading));

    try {
      final TherapistReviewModel newReview = createTherapistReview(
        therapistId: therapistId,
        reviewText: review,
        rating: state.userRating.toInt(),
        displayAnonymously: state.displayAnonymously,
      );
      
      final List<TherapistReviewModel> updatedList = [...state.reviews];
      updatedList.add(newReview);

      await _therapistRatingRepo.addReview(rating: newReview);
      emit(
        state.copyWith(
          reviews: updatedList,
          totalCount: (state.totalCount ?? 0) + 1,
          average: calculateAverageRating(updatedList),
          hasUserRated: hasUserRated(updatedList),
          status: TherapistReviewsStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TherapistReviewsStatus.failure,
          error: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }

  Future<void> updateReview({
    required TherapistReviewModel reviewModel,
    required String review,
  }) async {
    emit(state.copyWith(status: TherapistReviewsStatus.loading));

    try {
      final int finalRating = state.userRating == 0
          ? reviewModel.rating.toInt()
          : state.userRating.toInt();

      final TherapistReviewModel updatedReview = createTherapistReview(
        id: reviewModel.id,
        therapistId: reviewModel.therapistId,
        reviewText: review,
        rating: finalRating,
        displayAnonymously: state.displayAnonymously,
        createdAt: DateTime.now(),
      );

      await _therapistRatingRepo.updateReview(
        therapistReviewModel: updatedReview,
      );

      final List<TherapistReviewModel> updatedList = state.reviews.map((r) {
        return r.id == updatedReview.id ? updatedReview : r;
      }).toList();

      emit(
        state.copyWith(
          reviews: updatedList,
          average: calculateAverageRating(updatedList),
          hasUserRated: hasUserRated(updatedList),
          userRating: finalRating,
          status: TherapistReviewsStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TherapistReviewsStatus.failure,
          error: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }

  Future<void> deleteReview({
    required String ratingId,
    required String therapistId,
  }) async {
    emit(state.copyWith(status: TherapistReviewsStatus.loading));
    try {
      await _therapistRatingRepo.deleteReview(ratingId: ratingId);

      final updatedList = state.reviews.where((r) => r.id != ratingId).toList();
      emit(
        state.copyWith(
          reviews: updatedList,
          totalCount: ((state.totalCount ?? 1) - 1)
              .clamp(0, double.infinity)
              .toInt(),
          average: calculateAverageRating(updatedList),
          hasUserRated: hasUserRated(updatedList),
          status: TherapistReviewsStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TherapistReviewsStatus.failure,
          error: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }

  void updateUserRating({required num rating}) {
    emit(
      state.copyWith(
        status: TherapistReviewsStatus.initial,
        userRating: rating,
      ),
    );
  }

  void updateDisplayAnonymously({
    required bool displayAnonymously,
    required int selectedAnonymousIndex,
  }) {
    emit(
      state.copyWith(
        status: TherapistReviewsStatus.initial,
        displayAnonymously: displayAnonymously,
        selectedAnonymousIndex: selectedAnonymousIndex,
      ),
    );
  }
}
