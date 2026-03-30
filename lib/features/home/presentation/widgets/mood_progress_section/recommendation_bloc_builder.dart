import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../mood/data/models/dummy/dummy_recommendation.dart';
import '../../../../mood/data/models/recommendation_model.dart';
import '../../../../mood/presentation/manager/recommendation_cubit/recommendation_cubit.dart';
import 'recommendation_body.dart';

class RecommendationBlocBuilder extends StatelessWidget {
  const RecommendationBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationCubit, RecommendationState>(
      builder: (context, state) {
        switch (state) {
          case RecommendationLoadingState():
            return RecommendationBody(
              recommendationModel: DummyRecommendation.recommendationDummyModel,
              isLoading: true,
            );

          case RecommendationSuccessLoadedState(
            :final RecommendationModel recommendationModel,
          ):
            return RecommendationBody(recommendationModel: recommendationModel);

          case RecommendationFailureState(:final String errorMessage):
            return Center(child: Text(errorMessage));
        }
      },
    );
  }
}
