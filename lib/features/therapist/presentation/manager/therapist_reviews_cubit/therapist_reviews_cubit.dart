import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/therapist_review_model.dart';
import '../../../data/repos/therapist_reviews_repo.dart';
import '../../../domain/functions/create_review_model.dart';
import '../../../domain/functions/review_utils.dart';

part 'therapist_reviews_state.dart';

class TherapistReviewsCubit extends Cubit<TherapistReviewsState> {
  final TherapistReviewsRepo therapistRatingRepo;

  TherapistReviewsCubit({required this.therapistRatingRepo})
    : super(AddTherapistReviewLoadingState());

  Future<void> getReviews({required String therapistId}) async {
    emit(GetTherapistReviewsLoadingState());
    final result = await therapistRatingRepo.getReviews(
      therapistId: therapistId,
    );

    result.fold(
      (failure) =>
          emit(GetTherapistReviewsFailureState(errorMessage: failure.message)),
      (reviews) {
        emit(
          GetTherapistReviewsSuccessState(
            therapistReviewModel: reviews,
            average: calculateAverageRating(reviews),
            totalCount: reviews.length,
            userRating: 0,
            hasUserRated: hasUserRated(reviews),
          ),
        );
      },
    );
  }

  Future<void> addReview({
    required String therapistId,
    required String review,
    bool displayAnonymously = false,
  }) async {
    if (state is! GetTherapistReviewsSuccessState) return;
    final currentState = state as GetTherapistReviewsSuccessState;

    emit(AddTherapistReviewLoadingState());

    final TherapistReviewModel newReview = createTherapistReview(
      therapistId: therapistId,
      reviewText: review,
      rating: currentState.userRating.toInt(),
      displayAnonymously: displayAnonymously,
    );

    final result = await therapistRatingRepo.addReview(rating: newReview);
    result.fold(
      (failure) =>
          emit(AddTherapistReviewFailureState(errorMessage: failure.message)),
      (_) {
        emit(AddTherapistReviewSuccessState());
        getReviews(therapistId: therapistId);
      },
    );
  }

  Future<void> updateReview({
    required TherapistReviewModel reviewModel,
    required String review,
    bool displayAnonymously = false,
  }) async {
    if (state is! GetTherapistReviewsSuccessState) return;
    final currentState = state as GetTherapistReviewsSuccessState;

    emit(UpdateTherapistReviewLoadingState());

    final TherapistReviewModel updatedReview = createTherapistReview(
      id: reviewModel.id,
      therapistId: reviewModel.therapistId,
      reviewText: review,
      rating: currentState.userRating.toInt(),
      displayAnonymously: displayAnonymously,
      createdAt: DateTime.now(),
    );

    final result = await therapistRatingRepo.updateReview(
      therapistReviewModel: updatedReview,
    );
    result.fold(
      (failure) => emit(
        UpdateTherapistReviewFailureState(errorMessage: failure.message),
      ),
      (_) {
        emit(UpdateTherapistReviewSuccessState());
        getReviews(therapistId: reviewModel.therapistId);
      },
    );
  }

  Future<void> deleteReview({
    required String ratingId,
    required String therapistId,
  }) async {
    if (state is! GetTherapistReviewsSuccessState) return;

    emit(DeleteTherapistReviewLoadingState());
    final result = await therapistRatingRepo.deleteReview(ratingId: ratingId);

    result.fold(
      (failure) => emit(
        DeleteTherapistReviewFailureState(errorMessage: failure.message),
      ),
      (_) {
        emit(DeleteTherapistReviewSuccessState());
        getReviews(therapistId: therapistId);
      },
    );
  }

  void updateUserRating({required num rating}) {
    if (state is GetTherapistReviewsSuccessState) {
      final currentState = state as GetTherapistReviewsSuccessState;
      emit(currentState.copyWith(userRating: rating));
    }
  }
}
