import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/models/recommendation_model.dart';
import '../../../data/repos/recommendation_repo.dart';

part 'recommendation_state.dart';

class RecommendationCubit extends Cubit<RecommendationState> {
  final RecommendationRepo _recommendationRepo;

  RecommendationCubit({required RecommendationRepo recommendationRepo})
    : _recommendationRepo = recommendationRepo,
      super(RecommendationLoadingState());

  void getRecommendationData({required String currentMood}) async {
    try {
      final RecommendationModel recommendationModel = await _recommendationRepo
          .getRecommendationData(currentMood: currentMood);
      emit(
        RecommendationSuccessLoadedState(
          recommendationModel: recommendationModel,
        ),
      );
    } catch (e) {
      emit(
        RecommendationFailureState(
          errorMessage: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }
}
