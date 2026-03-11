import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/therapist_rating_model.dart';
import '../../../data/repos/therapist_rating_repo.dart';

part 'therapist_rating_state.dart';

class TherapistRatingCubit extends Cubit<TherapistRatingState> {
  final TherapistRatingRepo therapistRatingRepo;

  StreamSubscription<Either<Failure, List<TherapistRatingModel>>>? sub;

  TherapistRatingCubit({required this.therapistRatingRepo})
    : super(TherapistRatingInitial());

  void getRatings({required String therapistId}) async {
    emit(TherapistRatingLoading());

    final result = await therapistRatingRepo.getRatings(
      therapistId: therapistId,
    );

    result.fold(
      (failure) => emit(TherapistRatingFailure(error: failure.message)),
      (ratings) => emit(
        TherapistRatingLoaded(
          ratings: ratings,
          average: null,
          totalCount: null,
        ),
      ),
    );

    sub = therapistRatingRepo.listenToRatings(therapistId: therapistId).listen((
      either,
    ) {
      either.fold(
        (failure) => emit(TherapistRatingFailure(error: failure.message)),
        (ratings) => emit(
          TherapistRatingLoaded(
            ratings: ratings,
            average: null,
            totalCount: null,
          ),
        ),
      );
    });
  }

  Future<void> addRating({
    required String therapistId,
    required String userId,
    required int rating,
    required String review,
  }) async {
    final model = TherapistRatingModel(
      id: '',
      therapistId: therapistId,
      userId: userId,
      rating: rating,
      review: review,
      createdAt: DateTime.now(),
    );

    final result = await therapistRatingRepo.addRating(rating: model);

    result.fold(
      (failure) => emit(TherapistRatingFailure(error: failure.message)),
      (_) {},
    );
  }

  void loadRatingsWithSummary(String therapistId) async {
    emit(TherapistRatingLoading());

    final ratingsResult = await therapistRatingRepo.getRatings(
      therapistId: therapistId,
    );
    final summaryResult = await therapistRatingRepo.getRatingSummary(
      therapistId,
    );

    ratingsResult.fold(
      (failure) => emit(TherapistRatingFailure(error: failure.message)),
      (ratings) {
        summaryResult.fold(
          (failure) => emit(
            TherapistRatingLoaded(
              ratings: ratings,
              average: null,
              totalCount: null,
            ),
          ),
          (summary) {
            final avg = (summary['average'] ?? 0.0) as double;
            final count = (summary['count'] ?? 0) as int;

            emit(
              TherapistRatingLoaded(
                ratings: ratings,
                average: avg,
                totalCount: count,
              ),
            );
          },
        );
      },
    );
  }

  @override
  Future<void> close() {
    sub?.cancel();
    return super.close();
  }
}
