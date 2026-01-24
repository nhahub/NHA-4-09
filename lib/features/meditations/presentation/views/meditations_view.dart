import 'package:flutter/material.dart';
import 'package:moodly/core/enums/fade_position.dart';
import 'package:moodly/core/theming/app_assets.dart';
import 'package:moodly/core/widgets/fade_scrollable.dart';
import 'package:moodly/core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_overlay_widget.dart';
import '../../../../core/widgets/vertical_space.dart';
import '../widgets/categories_section/categories_section.dart';
import '../widgets/for_difficult_situations_section/for_difficult_situations_section.dart';
import '../widgets/new_arrivals_section/new_arrivals_section.dart';
import '../widgets/popular_categories_section/popular_categories_section.dart';
import '../widgets/recommended_for_you_section/recommended_for_you_section.dart';
import '../widgets/your_daily_routine_section/your_daily_routine_section.dart';

class MeditationsView extends StatelessWidget {
  final bool isPremium = true;
  const MeditationsView({super.key});

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
            const SliverToBoxAdapter(child: SizedBox(height: 80)),
            const SliverToBoxAdapter(child: CategoriesSection()),
            const SliverToBoxAdapter(child: VerticalSpace()),
            const SliverToBoxAdapter(child: RecommendedForYouSection()),
            const SliverToBoxAdapter(child: VerticalSpace()),
            if (isPremium) ...[
              const SliverToBoxAdapter(child: PopularCategoriesSection()),
              const SliverToBoxAdapter(child: VerticalSpace()),
            ],
            isPremium
                ? const SliverToBoxAdapter(child: YourDailyRoutineSection())
                : const SliverToBoxAdapter(
                    child: CustomOverlayWidget(
                      height: 320,
                      child: YourDailyRoutineSection(),
                    ),
                  ),
            if (isPremium) ...[
              const SliverToBoxAdapter(child: VerticalSpace()),
              const SliverToBoxAdapter(child: ForDifficultSituationsSection()),
              const SliverToBoxAdapter(child: VerticalSpace()),
              const SliverToBoxAdapter(child: NewArrivalsSection()),
            ],
            const SliverToBoxAdapter(child: SizedBox(height: 120)),
          ],
        ),
      ),
    );
  }
}
