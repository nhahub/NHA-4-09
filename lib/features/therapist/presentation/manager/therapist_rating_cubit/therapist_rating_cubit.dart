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
      : super(TherapistRatingInitial());

  Future<void> getRatings({required String therapistId}) async {
    emit(TherapistRatingLoading());

    await sub?.cancel();

    final result = await therapistRatingRepo.getRatings(
      therapistId: therapistId,
    );

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(TherapistRatingFailure(error: failure.message));
        }
      },
      (ratings) {
        if (!isClosed) {
          emit(
            TherapistRatingLoaded(
              ratings: ratings,
              average: null,
              totalCount: null,
              userRating: null,
            ),
          );
        }
      },
    );

    /// realtime listener
    sub = therapistRatingRepo
        .listenToRatings(therapistId: therapistId)
        .listen((either) {
      if (isClosed) return;

      either.fold(
        (failure) {
          if (!isClosed) {
            emit(TherapistRatingFailure(error: failure.message));
          }
        },
        (ratings) {
          if (!isClosed) {
            final currentUserRating = state is TherapistRatingLoaded
                ? (state as TherapistRatingLoaded).userRating
                : null;

            emit(
              TherapistRatingLoaded(
                ratings: ratings,
                average: null,
                totalCount: null,
                userRating: currentUserRating,
              ),
            );
          }
        },
      );
    });
  }

  Future<void> addRating({
    required String therapistId,
    required int rating,
    required String review,
  }) async {
    final model = TherapistRatingModel(
      id: '',
      therapistId: therapistId,
      userId: getUser()!.userId,
      rating: rating,
      review: review,
      createdAt: DateTime.now(),
    );

    final result = await therapistRatingRepo.addRating(rating: model);

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(TherapistRatingFailure(error: failure.message));
        }
      },
      (_) {},
    );
  }

  Future<void> loadRatingsWithSummary(String therapistId) async {
    emit(TherapistRatingLoading());

    final ratingsResult =
        await therapistRatingRepo.getRatings(therapistId: therapistId);

    final summaryResult =
        await therapistRatingRepo.getRatingSummary(therapistId);

    ratingsResult.fold(
      (failure) {
        if (!isClosed) {
          emit(TherapistRatingFailure(error: failure.message));
        }
      },
      (ratings) {
        summaryResult.fold(
          (failure) {
            if (!isClosed) {
              emit(
                TherapistRatingLoaded(
                  ratings: ratings,
                  average: null,
                  totalCount: null,
                  userRating: null,
                ),
              );
            }
          },
          (summary) {
            final avg = (summary['average'] ?? 0.0) as double;
            final count = (summary['count'] ?? 0) as int;

            if (!isClosed) {
              emit(
                TherapistRatingLoaded(
                  ratings: ratings,
                  average: avg,
                  totalCount: count,
                  userRating: null,
                ),
              );
            }
          },
        );
      },
    );
  }

  void updateUserRating({required double rating}) {
    if (state is TherapistRatingLoaded) {
      final currentState = state as TherapistRatingLoaded;

      if (!isClosed) {
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