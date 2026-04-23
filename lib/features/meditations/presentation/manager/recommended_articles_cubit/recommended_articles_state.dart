part of 'recommended_articles_cubit.dart';

sealed class RecommendedArticlesState extends Equatable {
  const RecommendedArticlesState();

  @override
  List<Object?> get props => [];
}

class RecommendedArticlesLoadingState extends RecommendedArticlesState {}

class RecommendedArticlesLoadedState extends RecommendedArticlesState {
  final List<ArticleModel> recommendedArticles;

  const RecommendedArticlesLoadedState({required this.recommendedArticles});

  @override
  List<Object?> get props => [recommendedArticles];
}

class RecommendedArticlesFailureState extends RecommendedArticlesState {
  final String message;
  const RecommendedArticlesFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}
