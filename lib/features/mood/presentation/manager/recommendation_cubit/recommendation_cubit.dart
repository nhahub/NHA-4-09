import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/mood/data/repos/recommendation_repo.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/recommendation_model.dart';

part 'recommendation_state.dart';

class RecommendationCubit extends Cubit<RecommendationState> {
  final RecommendationRepo recommendationRepo;
  RecommendationCubit({required this.recommendationRepo})
    : super(RecommendationLoadingState());

  void getRecommendationData() async {
    final Either<Failure, RecommendationModel> response =
        await recommendationRepo.getRecommendationData();

    response.fold(
      (failure) {
        emit(RecommendationFailureState(errorMessage: failure.message));
      },
      (recommendationModel) {
        emit(
          RecommendationSuccessLoadedState(
            recommendationModel: recommendationModel,
          ),
        );
      },
    );
  }
}
