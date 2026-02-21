import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theming/app_colors.dart';
import '../widgets/daily_stats_section/water_tracking/water_tracking_view_body.dart';
import '../widgets/shared/back_button_appbar.dart';

class WaterTrackingView extends StatelessWidget {
  const WaterTrackingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.bgFill,
        systemNavigationBarColor: AppColors.bgFill,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        appBar: BackButtonAppbar(title: "Water Tracking"),
        backgroundColor: AppColors.bgFill,
        body: WaterTrackingViewBody(),
      ),
    );
  }
}
