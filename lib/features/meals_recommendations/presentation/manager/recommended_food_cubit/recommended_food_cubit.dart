import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/models/recommended_food_item_model.dart';
import '../../../data/repos/recommended_food_repo.dart';
import '../../../domain/enums/food_type.dart';
part 'recommended_food_state.dart';

class RecommendedFoodCubit extends Cubit<RecommendedFoodState> {
  final RecommendedFoodRepo _recommendedFoodRepo;

  RecommendedFoodCubit({required RecommendedFoodRepo recommendedFoodRepo})
    : _recommendedFoodRepo = recommendedFoodRepo,
      super(GetRecommendedFoodLoadingState());

  Future<void> getRecommendedFood({required FoodType foodType}) async {
    try {
      final List<RecommendedFoodItemModel> recommendedFoodList =
          await _recommendedFoodRepo.getRecommendedFood(foodType: foodType);
      emit(
        GetRecommendedFoodSuccessState(
          recommendedFoodList: recommendedFoodList,
        ),
      );
    } catch (e) {
      emit(
        GetRecommendedFoodFailureState(
          message: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }
}
