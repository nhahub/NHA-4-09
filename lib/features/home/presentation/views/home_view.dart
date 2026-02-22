import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';
import '../widgets/daily_stats_section/shared/home_view_body.dart';
import '../../../mood/presentation/helpers/mood_helper.dart';
import '../../../../core/theming/app_assets.dart';
import '../../../../core/widgets/custom_appbar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final bool isPremium = kIsPremium;

  @override
  void initState() {
    super.initState();
    openDailyMoodDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar(
        title: "Home",
        isPremium: isPremium,
        icon: AppAssets.slidersHorizontalIcon,
        onTap: () {},
      ),
      body: HomeViewBody(isPremium: isPremium),
    );
  }
}
