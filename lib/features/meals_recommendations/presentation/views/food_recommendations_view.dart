import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/theming/app_colors.dart';
import 'package:moodly/core/widgets/custom_circular_progress_indicator.dart';
import 'package:moodly/features/home/presentation/widgets/shared/back_button_appbar.dart';
import 'package:moodly/features/meals_recommendations/domain/enums/food_type.dart';
import 'package:moodly/features/meals_recommendations/presentation/manager/food_cubit/food_recommendations_cubit.dart';
import 'package:moodly/features/meals_recommendations/presentation/widgets/meals_list_view.dart';
import 'package:moodly/features/meditations/presentation/widgets/categories_section/categories_section.dart';
import '../../../../core/enums/fade_position.dart';
import '../../../../core/widgets/fade_scrollable.dart';

class FoodRecommendationsView extends StatelessWidget {
  const FoodRecommendationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const BackButtonAppbar(title: "Recommended Food"),
      body: SafeArea(
        child: FadeScrollable(
          fadePosition: FadePosition.bottom,
          fadeHeightFromBottom: 20,
          child: Column(
            spacing: 20,
            children: [
              CategoriesSection<FoodType>(
                categories: FoodType.values,
                getTitle: (cat) => cat.title,
              ),
              BlocBuilder<FoodRecommendationsCubit, FoodRecommendationsState>(
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case const (FoodLoadingState):
                      return const CustomCircularProgressIndicator(
                        color: AppColors.brandGreen,
                      );
                    case const (FoodLoadedState):
                      final FoodLoadedState loadedState =
                          state as FoodLoadedState;
                      return MealsListView(food: loadedState.meals);

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
