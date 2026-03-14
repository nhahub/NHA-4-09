import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/functions/get_user.dart';
import 'package:uuid/uuid.dart';
import '../../../data/models/therapist_review_model.dart';
import '../../../data/repos/therapist_reviews_repo.dart';
part 'therapist_reviews_state.dart';

class TherapistReviewsCubit extends Cubit<TherapistReviewsState> {
  final TherapistReviewsRepo therapistRatingRepo;

  TherapistReviewsCubit({required this.therapistRatingRepo})
    : super(AddTherapistRatingsLoadingState());

  Future<void> getReviews({required String therapistId}) async {
    emit(GetTherapistReviewsLoadingState());

    final result = await therapistRatingRepo.getReviews(
      therapistId: therapistId,
    );

    result.fold(
      (failure) {
        emit(GetTherapistRatingsFailureState(error: failure.message));
      },
      (ratings) {
        emit(
          GetTherapistReviewsLoadedState(
            therapistReviewModel: ratings,
            average: ratings.isNotEmpty
                ? ratings.map((e) => e.rating).reduce((a, b) => a + b) /
                      ratings.length
                : 0,
            totalCount: ratings.length,
            userRating: 0,
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
    if (state is! GetTherapistReviewsLoadedState) return;

    final currentState = state as GetTherapistReviewsLoadedState;

    final num rating = currentState.userRating;

    emit(AddTherapistRatingsLoadingState());
    const uuid = Uuid();
    final TherapistReviewModel therapistRatingModel = TherapistReviewModel(
      id: uuid.v4(),
      therapistId: therapistId,
      userId: getUser()!.userId,
      userName: displayAnonymously ? 'Anonymous' : getUser()!.name ?? '',
      userAvatar: displayAnonymously ? null : getUser()!.image,
      rating: rating.toInt(),
      review: review,
      createdAt: DateTime.now(),
    );

    final result = await therapistRatingRepo.addReview(
      rating: therapistRatingModel,
    );

    result.fold(
      (failure) {
        emit(AddTherapistRatingsFailureState(error: failure.message));
      },
      (_) {
        emit(AddTherapistReviewAddedState());
        getReviews(therapistId: therapistId);
      },
    );
  }

  Future<void> updateReview({
    required String id,
    required String therapistId,
    required String userId,
    required String review,
    required DateTime createdAt,

    bool displayAnonymously = false,
  }) async {
    if (state is! GetTherapistReviewsLoadedState) return;

    final currentState = state as GetTherapistReviewsLoadedState;

    final num rating = currentState.userRating;

    emit(UpdateTherapistRatingsLoadingState());

    final result = await therapistRatingRepo.updateReview(
      therapistReviewModel: TherapistReviewModel(
        id: id,
        therapistId: therapistId,
        userId: userId,
        rating: rating.toInt(),
        review: review,
        userName: displayAnonymously ? 'Anonymous' : getUser()!.name ?? '',
        userAvatar: displayAnonymously ? null : getUser()!.image,
        createdAt: createdAt,
      ),
    );

    result.fold(
      (failure) {
        emit(UpdateTherapistRatingsFailureState(error: failure.message));
      },
      (_) {
        emit(UpdateTherapistRatingState());
        getReviews(therapistId: therapistId);
      },
    );
  }

  Future<void> deleteReview({
    required String ratingId,
    required String therapistId,
  }) async {
    if (state is! GetTherapistReviewsLoadedState) return;

    emit(DeleteTherapistRatingsLoadingState());

    final result = await therapistRatingRepo.deleteReview(ratingId: ratingId);

    result.fold(
      (failure) {
        emit(DeleteTherapistRatingsFailureState(error: failure.message));
      },
      (_) {
        emit(DeleteTherapistRatingState());
        getReviews(therapistId: therapistId);
      },
    );
  }

  void updateUserRating({required num rating}) {
    if (state is GetTherapistReviewsLoadedState) {
      final currentState = state as GetTherapistReviewsLoadedState;
      emit(currentState.copyWith(userRating: rating));
    }
  }
}
