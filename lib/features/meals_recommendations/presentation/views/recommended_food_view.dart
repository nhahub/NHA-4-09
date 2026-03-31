import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/enums/fade_position.dart';
import '../../../../core/widgets/fade_scrollable.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';
import '../../../meditations/presentation/widgets/categories_section/categories_section.dart';
import '../../data/models/dummy/dummy_recommended_food_items.dart';
import '../../data/models/recommended_food_item_model.dart';
import '../../domain/enums/food_type.dart';
import '../manager/recommended_food_cubit/recommended_food_cubit.dart';
import '../widgets/recommended_food_list_view.dart';

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
                  );
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (_scrollController.hasClients) {
                      _scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeOut,
                      );
                    }
                  });
                },
              ),
              const SizedBox(height: 10),
              BlocBuilder<RecommendedFoodCubit, RecommendedFoodState>(
                builder: (context, state) {
                  switch (state) {
                    case GetRecommendedFoodLoadingState():
                      return RecommendedFoodListView(
                        food: DummyRecommendedFoodItems.dummyFoodItems,
                        controller: _scrollController,
                        isLoading: true,
                      );

                    case GetRecommendedFoodSuccessState(
                      :final List<RecommendedFoodItemModel> recommendedFoodList,
                    ):
                      return RecommendedFoodListView(
                        food: recommendedFoodList,
                        controller: _scrollController,
                      );

                    case GetRecommendedFoodFailureState(:final message):
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: kAppHorizontalPadding,
                        ),
                        child: Text(message, textAlign: TextAlign.center),
                      );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
