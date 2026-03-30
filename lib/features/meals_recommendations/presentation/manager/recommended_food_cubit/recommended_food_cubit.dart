import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/recommended_food_item_model.dart';
import '../../../data/repos/recommended_food_repo.dart';
import '../../../domain/enums/food_type.dart';

part 'recommended_food_state.dart';

class RecommendedFoodCubit extends Cubit<RecommendedFoodState> {
  final RecommendedFoodRepo recommendedFoodRepo;

  RecommendedFoodCubit({required this.recommendedFoodRepo})
    : super(GetRecommendedFoodLoadingState());

  Future<void> getRecommendedFood({required FoodType foodType}) async {
    final Either<Failure, List<RecommendedFoodItemModel>> response =
        await recommendedFoodRepo.getRecommendedFood(foodType: foodType);

    return response.fold(
      (failure) =>
          emit(GetRecommendedFoodFailureState(message: failure.message)),
      (response) =>
          emit(GetRecommendedFoodSuccessState(recommendedFoodList: response)),
    );
  }
}
