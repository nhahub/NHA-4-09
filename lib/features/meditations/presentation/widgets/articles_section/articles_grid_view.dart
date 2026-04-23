import 'package:flutter/material.dart';
import 'package:moodly/features/meditations/presentation/widgets/articles_section/article_card.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/constants/constants.dart';
import '../../../data/mock_data/new_arrivals_data.dart';

class ArticlesGridView extends StatelessWidget {
  final bool isLoading;
  const ArticlesGridView({super.key, this.isLoading = false});

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
            return ArticleCard(article: newArrivalsData[index]);
          },
          itemCount: newArrivalsData.length,
        ),
      ),
    );
  }
}
