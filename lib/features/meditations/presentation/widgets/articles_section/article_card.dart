import 'package:flutter/material.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/models/media_model.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/shared/adaptive_image.dart';
import '../../../../../core/widgets/shared/card_description_container.dart';
import '../../../../../core/widgets/shared/category_container.dart';

class ArticleCard extends StatelessWidget {
  final MediaModel article;
  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.articlesView, args: article);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            AdaptiveImage(
              imageUrl: article.coverUrl,
              height: double.infinity,
              borderRadius: BorderRadius.circular(16),
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: CategoryContainer(categoryTitle: article.category),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CardDescriptionContainer(
                title: article.title,
                withDuration: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
