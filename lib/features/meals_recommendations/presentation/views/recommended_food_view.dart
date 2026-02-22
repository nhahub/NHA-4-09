import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/theming/app_colors.dart';
import 'package:moodly/core/widgets/custom_circular_progress_indicator.dart';
import 'package:moodly/features/home/presentation/widgets/shared/back_button_appbar.dart';
import 'package:moodly/features/meals_recommendations/domain/enums/food_type.dart';
import 'package:moodly/features/meals_recommendations/domain/enums/mood_type.dart';
import 'package:moodly/features/meals_recommendations/presentation/manager/recommended_food_cubit/recommended_food_cubit.dart';
import 'package:moodly/features/meals_recommendations/presentation/widgets/recommended_food_list_view.dart';
import 'package:moodly/features/meditations/presentation/widgets/categories_section/categories_section.dart';
import '../../../../core/enums/fade_position.dart';
import '../../../../core/widgets/fade_scrollable.dart';

class RecommendedFoodView extends StatefulWidget {
  const RecommendedFoodView({super.key});

  @override
  State<RecommendedFoodView> createState() => _RecommendedFoodViewState();
}

class _RecommendedFoodViewState extends State<RecommendedFoodView> {
  final ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const BackButtonAppbar(title: "Recommended Food"),
      body: FadeScrollable(
        fadePosition: FadePosition.bottom,
        fadeHeightFromBottom: 25,
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              CategoriesSection<FoodType>(
                categories: FoodType.values,
                getTitle: (cat) => cat.title,
                onCategorySelected: (FoodType foodType) {
                  context.read<RecommendedFoodCubit>().getRecommendedFood(
                    foodType: foodType,
                    moodType: MoodType.angry,
                  );
                  _scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOut,
                  );
                },
              ),
              const SizedBox(height: 10),
              BlocBuilder<RecommendedFoodCubit, RecommendedFoodState>(
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case const (GetRecommendedFoodInitialState):
                      return const Center(
                        child: CustomCircularProgressIndicator(
                          color: AppColors.brandGreen,
                        ),
                      );
                    case const (GetRecommendedFoodLoadingState):
                      return const Center(
                        child: CustomCircularProgressIndicator(
                          color: AppColors.brandGreen,
                        ),
                      );
                    case const (GetRecommendedFoodSuccessState):
                      final GetRecommendedFoodSuccessState loadedState =
                          state as GetRecommendedFoodSuccessState;
                      return RecommendedFoodListView(
                        food: loadedState.recommendedFoodList,
                        controller: _scrollController,
                      );

                    default:
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
