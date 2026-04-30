import 'package:flutter/material.dart';

import '../../../../../core/extensions/sliver_extension.dart';
import '../../../../../core/widgets/custom_overlay_widget.dart';
import '../../../../../core/widgets/vertical_space.dart';
import '../asmr_section/asmr_section.dart';
import '../podcast_section/podcast_section.dart';
import '../recommended_articles_section/articles_section.dart';
import '../recommended_books_section/recommended_books_section.dart';
import '../recommended_videos_section/recommended_videos_section.dart';

class MeditationsViewBody extends StatelessWidget {
  const MeditationsViewBody({super.key, required this.isPremium});

  final bool isPremium;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        space(height: 80),
        const PodcastSection().toSliver(),
        space(),
        isPremium
            ? const RecommendedVideosSection().toSliver()
            : const CustomOverlayWidget(
                height: 320,
                child: RecommendedVideosSection(),
              ).toSliver(),
        space(),
        if (isPremium) ...[
          const AsmrSection().toSliver(),
          space(),
          const RecommendedBooksSection().toSliver(),
          space(),
          const ArticlesSection().toSliver(),
        ],
        space(height: 120),
      ],
    );
  }
}
