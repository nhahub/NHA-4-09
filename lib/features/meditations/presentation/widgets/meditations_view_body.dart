import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_overlay_widget.dart';
import 'asmr_section/asmr_section.dart';
import 'categories_section/categories_section.dart';
import 'new_arrivals_section/new_arrivals_section.dart';
import 'popular_categories_section/popular_categories_section.dart';
import 'recommended_for_you_section/recommended_for_you_section.dart';
import 'your_daily_routine_section/your_daily_routine_section.dart';
import '../../../../core/extensions/sliver_extension.dart';
import '../../../../core/widgets/vertical_space.dart';
import '../../data/models/category_enum.dart';

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
        const RecommendedForYouSection().toSliver(),
        space(),
        if (isPremium) ...[
          const PopularCategoriesSection().toSliver(),
          space(),
        ],
        isPremium
            ? const YourDailyRoutineSection().toSliver()
            : const CustomOverlayWidget(
                height: 320,
                child: YourDailyRoutineSection(),
              ).toSliver(),
        if (isPremium) ...[
          space(),
          const AsmrSection().toSliver(),
          space(),
          const NewArrivalsSection().toSliver(),
        ],
        space(height: 120),
      ],
    );
  }
}
