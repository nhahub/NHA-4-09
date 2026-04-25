import 'package:flutter/material.dart';

import '../../../../core/widgets/shared/adaptive_image.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';
import '../../data/models/article_model.dart';
import '../widgets/recommended_articles_section/article_content.dart';
import '../widgets/recommended_articles_section/swipe_widget.dart';

class ArticlesView extends StatefulWidget {
  final ArticleModel article;
  const ArticlesView({super.key, required this.article});

  @override
  State<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView> {
  double sheetHeight = 0.4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const BackButtonAppbar(
        withFade: false,
        backgroundcolor: Color(0xffdfdfdb),
      ),
      body: Stack(
        children: [
          AdaptiveImage(
            imageUrl: widget.article.articleImage,
            height: double.infinity,
            fit: BoxFit.fill,
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                setState(() {
                  sheetHeight -= details.delta.dy / 500;
                  sheetHeight = sheetHeight.clamp(0.4, 0.87);
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.height * sheetHeight,
                decoration: const BoxDecoration(
                  color: Color(0xfff6f8fa),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: ArticleContent(
                  article: widget.article,
                  sheetHeight: sheetHeight,
                ),
              ),
            ),
          ),
          if (sheetHeight == 0.4) const SwipeWidget(),
        ],
      ),
    );
  }
}
