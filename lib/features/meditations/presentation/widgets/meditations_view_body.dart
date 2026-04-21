import 'package:flutter/material.dart';

import '../../../../core/extensions/sliver_extension.dart';
import '../../../../core/widgets/custom_overlay_widget.dart';
import '../../../../core/widgets/vertical_space.dart';
import '../../data/models/category_enum.dart';
import 'asmr_section/asmr_section.dart';
import 'categories_section/categories_section.dart';
import 'new_arrivals_section/new_arrivals_section.dart';
import 'podcast_section/podcast_section.dart';
import 'recommended_books_section/recommended_books_section.dart';
import 'your_daily_routine_section/your_daily_routine_section.dart';

class MeditationsViewBody extends StatelessWidget {
  const MeditationsViewBody({super.key, required this.isPremium});

  final bool isPremium;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        space(height: 80),
        CategoriesSection<Category>(
          categories: Category.values,
          getTitle: (cat) => cat.title,
          onCategorySelected: (Category category) {},
        ).toSliver(),
        space(),

        isPremium
            ? const YourDailyRoutineSection().toSliver()
            : const CustomOverlayWidget(
                height: 320,
                child: YourDailyRoutineSection(),
              ).toSliver(),
        space(),
        if (isPremium) ...[const PodcastSection().toSliver(), space()],
        if (isPremium) ...[
          const AsmrSection().toSliver(),
          space(),
          const RecommendedBooksSection().toSliver(),
          space(),
          const NewArrivalsSection().toSliver(),
        ],
        space(height: 120),
      ],
    );
  }
}
