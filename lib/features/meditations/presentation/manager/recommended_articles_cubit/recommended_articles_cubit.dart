import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/models/article_model.dart';
import '../../../data/repos/recommended_articles_repo.dart';
part 'recommended_articles_state.dart';

class RecommendedArticlesCubit extends Cubit<RecommendedArticlesState> {
  final RecommendedArticlesRepo _recommendedArticlesRepo;

  RecommendedArticlesCubit({
    required RecommendedArticlesRepo recommendedArticlesRepo,
  }) : _recommendedArticlesRepo = recommendedArticlesRepo,
       super(RecommendedArticlesLoadingState());

  void getRecommendedArticles() async {
    try {
      final List<ArticleModel> recommendedArticles =
          await _recommendedArticlesRepo.getRecommendedArticles();
      emit(
        RecommendedArticlesLoadedState(
          recommendedArticles: recommendedArticles,
        ),
      );
    } catch (e) {
      emit(
        RecommendedArticlesFailureState(
          message: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }
}
