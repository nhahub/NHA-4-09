import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/functions/get_user.dart';
import 'package:uuid/uuid.dart';
import '../../../../../core/errors/failure.dart';
import '../../../data/models/therapist_rating_model.dart';
import '../../../data/repos/therapist_rating_repo.dart';
part 'therapist_rating_state.dart';

class TherapistRatingCubit extends Cubit<TherapistRatingState> {
  final TherapistRatingRepo therapistRatingRepo;

  StreamSubscription<Either<Failure, List<TherapistRatingModel>>>? sub;

  TherapistRatingCubit({required this.therapistRatingRepo})
    : super(AddTherapistRatingsLoadingState());

  Future<void> getRatings({required String therapistId}) async {
    emit(GetTherapistRatingsLoadingState());

    final result = await therapistRatingRepo.getRatings(
      therapistId: therapistId,
    );

    result.fold(
      (failure) {
        emit(GetTherapistRatingsFailureState(error: failure.message));
      },
      (ratings) {
        emit(
          GetTherapistRatingsLoadedState(
            ratings: ratings,
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

  Future<void> addRating({
    required String therapistId,
    required String review,
    bool displayAnonymously = false,
  }) async {
    if (state is! GetTherapistRatingsLoadedState) return;

    final currentState = state as GetTherapistRatingsLoadedState;

    final num rating = currentState.userRating;

    emit(AddTherapistRatingsLoadingState());
    const uuid = Uuid();
    final TherapistRatingModel therapistRatingModel = TherapistRatingModel(
      id: uuid.v4(),
      therapistId: therapistId,
      userId: getUser()!.userId,
      userName: displayAnonymously ? 'Anonymous' : getUser()!.name ?? '',
      userAvatar: displayAnonymously ? null : getUser()!.image,
      rating: rating.toInt(),
      review: review,
      createdAt: DateTime.now(),
    );

    final result = await therapistRatingRepo.addRating(
      rating: therapistRatingModel,
    );

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(AddTherapistRatingsFailureState(error: failure.message));
        }
      },
      (_) {
        if (!isClosed) {
          emit(AddTherapistRatingsAddedState());
          getRatings(therapistId: therapistId);
        }
      },
    );
  }

  void updateUserRating({required num rating}) {
    if (!isClosed) {
      if (state is GetTherapistRatingsLoadedState) {
        final currentState = state as GetTherapistRatingsLoadedState;
        emit(currentState.copyWith(userRating: rating));
      }
    }
  }
}
