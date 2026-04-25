import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../data/models/article_model.dart';
import '../../../data/models/dummy/dummy_articles.dart';
import '../../manager/recommended_articles_cubit/recommended_articles_cubit.dart';
import 'recommended_articles_grid_view.dart';

class RecommendedArticlesBlocBuilder extends StatelessWidget {
  const RecommendedArticlesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedArticlesCubit, RecommendedArticlesState>(
      builder: (context, state) {
        switch (state) {
          case RecommendedArticlesLoadingState():
            return RecommendedArticlesGridView(
              recommendedArticles: DummyArticles.dummyArticles,
              isLoading: true,
            );
          case RecommendedArticlesLoadedState(
            recommendedArticles: final List<ArticleModel> recommendedArticles,
          ):
            return RecommendedArticlesGridView(
              recommendedArticles: recommendedArticles,
            );
          case RecommendedArticlesFailureState(message: final String message):
            return CustomErrorWidget(message: message);
        }
      },
    );
  }
}
