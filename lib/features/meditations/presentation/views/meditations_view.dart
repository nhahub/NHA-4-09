import 'package:flutter/material.dart';
import '../../../../core/enums/fade_position.dart';
import '../../../../core/extensions/sliver_extension.dart';
import '../../../../core/theming/app_assets.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_overlay_widget.dart';
import '../../../../core/widgets/fade_scrollable.dart';
import '../../../../core/widgets/vertical_space.dart';
import '../../data/models/category_enum.dart';
import '../widgets/asmr_section/asmr_section.dart';
import '../widgets/categories_section/categories_section.dart';
import '../widgets/new_arrivals_section/new_arrivals_section.dart';
import '../widgets/popular_categories_section/popular_categories_section.dart';
import '../widgets/recommended_for_you_section/recommended_for_you_section.dart';
import '../widgets/your_daily_routine_section/your_daily_routine_section.dart';

class MeditationsView extends StatelessWidget {
  final bool isPremium;
  const MeditationsView({super.key, required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar(
        title: "Meditations",
        isPremium: isPremium,
        icon: AppAssets.searchIcon,
        onTap: () {},
      ),
      body: FadeScrollable(
        fadePosition: FadePosition.bottom,
        child: CustomScrollView(
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
        ),
      ),
    );
  }
}
