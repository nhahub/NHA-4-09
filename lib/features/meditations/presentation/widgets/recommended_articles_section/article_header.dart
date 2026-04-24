import 'package:flutter/material.dart';
import 'package:moodly/features/meditations/data/models/article_model.dart';
import '../../../../../core/extensions/date_format_extensions.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/user_avatar.dart';

class ArticleHeader extends StatelessWidget {
  final ArticleModel article;

  const ArticleHeader({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserAvatar(
          imageUrl: article.authorImage,
          name: article.authorName,
          radius: 20,
          fontSize: 20,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("By ${article.authorName}", style: AppStyles.medium16),
            Text(
              article.publishedAt.toFormattedDate(),
              style: AppStyles.bold14.copyWith(color: AppColors.bodyGray),
            ),
          ],
        ),
      ],
    );
  }
}
