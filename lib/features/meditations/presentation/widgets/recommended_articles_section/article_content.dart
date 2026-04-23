import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/core/theming/app_styles.dart';
import 'package:moodly/features/meditations/presentation/widgets/recommended_articles_section/article_header.dart';
import '../../../data/models/article_model.dart';

class ArticleContent extends StatelessWidget {
  final ArticleModel article;

  const ArticleContent({super.key, required this.article});

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
          ArticleHeader(article: article),
          const SizedBox(height: 10),
          Text(article.title, style: AppStyles.extraBold17),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Markdown(data: article.content),
            ),
          ),
        ],
      ),
    );
  }
}
