part of 'recommendation_cubit.dart';

sealed class RecommendationState extends Equatable {
  const RecommendationState();

  @override
  List<Object> get props => [];
}

class RecommendationLoadingState extends RecommendationState {}

class RecommendationSuccessLoadedState extends RecommendationState {
  final RecommendationModel recommendationModel;
  const RecommendationSuccessLoadedState({required this.recommendationModel});

  @override
  List<Object> get props => [recommendationModel];
}

class RecommendationFailureState extends RecommendationState {
  final String errorMessage;
  const RecommendationFailureState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
