import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/core/theming/app_styles.dart';
import 'package:moodly/features/meditations/presentation/widgets/articles_section/article_header.dart';
import '../../../../../core/models/media_model.dart';

class ArticleContent extends StatelessWidget {
  const ArticleContent({super.key, required this.article});

  final MediaModel article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kAppHorizontalPadding,
        vertical: kAppVerticalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ArticleHeader(),
          const SizedBox(height: 10),
          Text(article.title * 2, style: AppStyles.extraBold17),
          const SizedBox(height: 10),
          const Expanded(
            child: SingleChildScrollView(
              child: Text("Article content here...", style: AppStyles.medium15),
            ),
          ),
        ],
      ),
    );
  }
}
