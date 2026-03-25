import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../mood/data/models/dummy/dummy_recommendation.dart';
import '../../../../mood/presentation/manager/recommendation_cubit/recommendation_cubit.dart';
import 'recommendation_body.dart';

class RecommendationBlocBuilder extends StatelessWidget {
  const RecommendationBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationCubit, RecommendationState>(
      builder: (context, state) {
        if (state is RecommendationLoadingState) {
          return Center(
            child: RecommendationBody(
              recommendationModel: DummyRecommendation.recommendationDummyModel,
              isLoading: true,
            ),
          );
        } else if (state is RecommendationSuccessLoadedState) {
          return RecommendationBody(
            recommendationModel: state.recommendationModel,
          );
        } else if (state is RecommendationFailureState) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
