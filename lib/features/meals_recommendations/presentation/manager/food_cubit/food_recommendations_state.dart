part of 'food_recommendations_cubit.dart';

sealed class FoodRecommendationsState extends Equatable {
  const FoodRecommendationsState();

  @override
  List<Object?> get props => [];
}

class FoodInitialState extends FoodRecommendationsState {}

class FoodLoadingState extends FoodRecommendationsState {}

class FoodLoadedState extends FoodRecommendationsState {
  final List<MoodFoodModel> meals;
  final FoodType selectedCategory;

  const FoodLoadedState({required this.meals, required this.selectedCategory});

  @override
  List<Object?> get props => [meals, selectedCategory];
}

class FoodErrorState extends FoodRecommendationsState {
  final String message;
  const FoodErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
