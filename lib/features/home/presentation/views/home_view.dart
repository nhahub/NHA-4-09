import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/home/data/repos/water_repo.dart';
import 'package:moodly/features/home/presentation/manager/cups_of_water_cubit/water_tracking_cubit.dart';
import 'package:moodly/features/home/presentation/widgets/daily_stats_section/shared/home_view_body.dart';
import 'package:moodly/features/mood/presentation/helpers/mood_helper.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/theming/app_assets.dart';
import '../../../../core/widgets/custom_appbar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final bool isPremium = true;

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
      body: BlocProvider(
        create: (context) =>
            WaterTrackingCubit(waterRepo: getIt.get<WaterRepo>())..loadData(),
        child: HomeViewBody(isPremium: isPremium),
      ),
    );
  }
}
