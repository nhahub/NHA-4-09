import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/theming/app_styles.dart';
import 'article_header.dart';
import '../../../data/models/article_model.dart';

class ArticleContent extends StatelessWidget {
  final ArticleModel article;
  final double sheetHeight;

  const ArticleContent({
    super.key,
    required this.article,
    required this.sheetHeight,
  });

  @override
  Widget build(BuildContext context) {
    final bool enableScroll = sheetHeight > 0.8;
    final bool isCollapsed = sheetHeight == 0.4;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kAppHorizontalPadding,
        vertical: kAppVerticalPadding,
      ),
      child: CustomScrollView(
        physics: enableScroll
            ? const BouncingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: ArticleHeader(article: article)),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(
            child: Text(article.title, style: AppStyles.extraBold21),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(
            child: Markdown(
              data: isCollapsed
                  ? _getPreview(article.content)
                  : article.content,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }

  String _getPreview(String text) {
    return text.length > 150 ? "${text.substring(0, 150)}..." : text;
  }
}
