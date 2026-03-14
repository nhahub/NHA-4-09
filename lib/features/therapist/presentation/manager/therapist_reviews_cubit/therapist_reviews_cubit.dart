import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/functions/get_user.dart';
import 'package:uuid/uuid.dart';
import '../../../data/models/therapist_review_model.dart';
import '../../../data/repos/therapist_reviews_repo.dart';
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
      (failure) {
        emit(GetTherapistReviewsFailureState(errorMessage: failure.message));
      },
      (reviews) {
        final hasUserRated = _checkIfUserRated(reviews);
        emit(
          GetTherapistReviewsSuccessState(
            therapistReviewModel: reviews,
            average: reviews.isNotEmpty
                ? reviews.map((e) => e.rating).reduce((a, b) => a + b) /
                      reviews.length
                : 0,
            totalCount: reviews.length,
            userRating: 0,
            hasUserRated: hasUserRated,
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

    final num rating = currentState.userRating;

    emit(AddTherapistReviewLoadingState());
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
        emit(AddTherapistReviewFailureState(errorMessage: failure.message));
      },
      (_) {
        emit(AddTherapistReviewSuccessState());
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
    if (state is! GetTherapistReviewsSuccessState) return;

    final currentState = state as GetTherapistReviewsSuccessState;

    final num rating = currentState.userRating;

    emit(UpdateTherapistReviewLoadingState());

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
        emit(UpdateTherapistReviewFailureState(errorMessage: failure.message));
      },
      (_) {
        emit(UpdateTherapistReviewSuccessState());
        getReviews(therapistId: therapistId);
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
      (failure) {
        emit(DeleteTherapistReviewFailureState(errorMessage: failure.message));
      },
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

  bool _checkIfUserRated(List<TherapistReviewModel> reviews) {
    final userId = getUser()?.userId;

    if (userId == null) return false;

    return reviews.any((review) => review.userId == userId);
  }
}
