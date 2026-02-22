part of 'recommended_food_cubit.dart';

sealed class RecommendedFoodState extends Equatable {
  const RecommendedFoodState();

  @override
  List<Object?> get props => [];
}

class GetRecommendedFoodInitialState extends RecommendedFoodState {}

class GetRecommendedFoodLoadingState extends RecommendedFoodState {}

class GetRecommendedFoodSuccessState extends RecommendedFoodState {
  final List<RecommendedFoodItemModel> recommendedFoodList;

  const GetRecommendedFoodSuccessState({required this.recommendedFoodList});

  @override
  List<Object?> get props => [recommendedFoodList];
}

class GetRecommendedFoodFailureState extends RecommendedFoodState {
  final String message;
  const GetRecommendedFoodFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}
