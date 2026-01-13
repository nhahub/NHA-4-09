import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../widgets/categories_section/categories_section.dart';
import '../widgets/for_difficult_situations_section/for_difficult_situations_section.dart';
import '../widgets/meditations_app_bar/meditations_app_bar.dart';
import '../widgets/new_arrivals_section/new_arrivals_section.dart';
import '../widgets/popular_categories_section/popular_categories_section.dart';
import '../widgets/recommended_for_you_section/recommended_for_you_section.dart';
import '../widgets/your_daily_routine_section/your_daily_routine_section.dart';

class MeditationsView extends StatelessWidget {
  const MeditationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
      child: Column(
        children: [
          SizedBox(height: 70),
          MeditationsAppBar(),
          SizedBox(height: 70),
          CategoriesSection(),
          SizedBox(height: 70),
          RecommendedForYouSection(),
          SizedBox(height: 70),
          PopularCategoriesSection(),
          SizedBox(height: 70),
          YourDailyRoutineSection(),
          SizedBox(height: 70),
          ForDifficultSituationsSection(),
          SizedBox(height: 70),
          NewArrivalsSection(),
          SizedBox(height: 70),
        ],
      ),
    );
  }
}
