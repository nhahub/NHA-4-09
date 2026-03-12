import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/functions/get_user.dart';
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
    await sub?.cancel();

    final result = await therapistRatingRepo.getRatings(
      therapistId: therapistId,
    );

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(AddTherapistRatingsFailureState(error: failure.message));
        }
      },
      (ratings) {
        if (!isClosed) {
          emit(
            GetTherapistRatingsLoadedState(
              ratings: ratings,
              average: null,
              totalCount: null,
              userRating: 0,
            ),
          );
        }
      },
    );

    /// realtime listener
    sub = therapistRatingRepo.listenToRatings(therapistId: therapistId).listen((
      either,
    ) {
      if (isClosed) return;

      either.fold(
        (failure) {
          if (!isClosed) {
            emit(GetTherapistRatingsFailureState(error: failure.message));
          }
        },
        (ratings) {
          if (!isClosed) {
            final currentUserRating = state is GetTherapistRatingsLoadedState
                ? (state as GetTherapistRatingsLoadedState).userRating
                : null;

            emit(
              GetTherapistRatingsLoadedState(
                ratings: ratings,
                average: null,
                totalCount: null,
                userRating: currentUserRating ?? 0,
              ),
            );
          }
        },
      );
    });
  }

  Future<void> addRating({
    required String therapistId,
    required String review,
  }) async {
    if (state is! GetTherapistRatingsLoadedState) return;

    final currentState = state as GetTherapistRatingsLoadedState;

    final num rating = currentState.userRating;

    emit(AddTherapistRatingsLoadingState());

    final TherapistRatingModel therapistRatingModel = TherapistRatingModel(
      id: "fdfdfgffdh",
      therapistId: therapistId,
      userId: getUser()!.userId,
      userName: getUser()!.name ?? '',
      userAvatar: getUser()!.image,
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
          emit(
            GetTherapistRatingsLoadedState(
              ratings: currentState.ratings,
              average: currentState.average,
              totalCount: currentState.totalCount,
              userRating: rating,
            ),
          );
        }
      },
    );
  }

  Future<void> loadRatingsWithSummary(String therapistId) async {
    emit(AddTherapistRatingsLoadingState());

    final ratingsResult = await therapistRatingRepo.getRatings(
      therapistId: therapistId,
    );

    final summaryResult = await therapistRatingRepo.getRatingSummary(
      therapistId,
    );

    ratingsResult.fold(
      (failure) {
        if (!isClosed) {
          emit(AddTherapistRatingsFailureState(error: failure.message));
        }
      },
      (ratings) {
        summaryResult.fold(
          (failure) {
            if (!isClosed) {
              emit(
                GetTherapistRatingsLoadedState(
                  ratings: ratings,
                  average: null,
                  totalCount: null,
                  userRating: 0,
                ),
              );
            }
          },
          (summary) {
            final avg = (summary['average'] ?? 0.0) as double;
            final count = (summary['count'] ?? 0) as int;

            if (!isClosed) {
              emit(
                GetTherapistRatingsLoadedState(
                  ratings: ratings,
                  average: avg,
                  totalCount: count,
                  userRating: 0,
                ),
              );
            }
          },
        );
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

  @override
  Future<void> close() async {
    await sub?.cancel();
    return super.close();
  }
}
