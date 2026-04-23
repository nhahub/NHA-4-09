import 'package:flutter/material.dart';
import 'package:moodly/features/meditations/presentation/widgets/recommended_articles_section/article_card.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/constants/constants.dart';
import '../../../data/models/article_model.dart';

class RecommendedArticlesGridView extends StatelessWidget {
  final List<ArticleModel> recommendedArticles;

  final bool isLoading;
  const RecommendedArticlesGridView({
    super.key,
    this.isLoading = false,
    required this.recommendedArticles,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
      child: Skeletonizer(
        containersColor: Colors.grey[50],
        enabled: isLoading,
        child: GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 165.64 / 313.91,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return ArticleCard(article: recommendedArticles[index]);
          },
          itemCount: recommendedArticles.length,
        ),
      ),
    );
  }
}
