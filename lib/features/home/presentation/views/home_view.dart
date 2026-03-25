import 'package:flutter/material.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../mood/presentation/helpers/mood_helper.dart';
import '../widgets/daily_stats_section/shared/home_view_body.dart';
import '../widgets/sessions_for_you_section/sessions_floating_action_button.dart';

class HomeView extends StatefulWidget {
  final bool isPremium;
  const HomeView({super.key, required this.isPremium});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    openDailyMoodDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: const SessionsFloatingActionButton(),
      appBar: CustomAppbar(
        title: "Home",
        isPremium: widget.isPremium,
        icon: AppAssets.slidersHorizontalIcon,
        onTap: () {},
      ),
      body: HomeViewBody(isPremium: widget.isPremium),
    );
  }
}


