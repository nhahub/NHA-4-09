import 'package:flutter/material.dart';
import 'package:moodly/core/widgets/custom_overlay_widget.dart';

import '../../../../core/widgets/vertical_space.dart';
import '../widgets/categories_section/categories_section.dart';
import '../widgets/for_difficult_situations_section/for_difficult_situations_section.dart';
import '../widgets/meditations_app_bar/meditations_app_bar.dart';
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
      body: Column(
        children: [
          const VerticalSpace(),
          MeditationsAppBar(isPremium: isPremium),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: VerticalSpace()),
                SliverToBoxAdapter(child: CategoriesSection()),
                SliverToBoxAdapter(child: VerticalSpace()),
                SliverToBoxAdapter(child: RecommendedForYouSection()),
                SliverToBoxAdapter(child: VerticalSpace()),
                if (isPremium) ...[
                  SliverToBoxAdapter(child: PopularCategoriesSection()),
                  SliverToBoxAdapter(child: VerticalSpace()),
                ],
                isPremium
                    ? SliverToBoxAdapter(child: YourDailyRoutineSection())
                    : SliverToBoxAdapter(
                        child: CustomOverlayWidget(
                          height: 320,
                          child: YourDailyRoutineSection(),
                        ),
                      ),
                if (isPremium) ...[
                  SliverToBoxAdapter(child: VerticalSpace()),
                  SliverToBoxAdapter(child: ForDifficultSituationsSection()),
                  SliverToBoxAdapter(child: VerticalSpace()),
                  SliverToBoxAdapter(child: NewArrivalsSection()),
                ],
                SliverToBoxAdapter(child: const SizedBox(height: 120)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
