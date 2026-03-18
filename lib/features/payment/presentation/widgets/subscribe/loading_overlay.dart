import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/widgets/custom_circular_progress_indicator.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CustomCircularProgressIndicator(color: AppColors.lightGreen),
    );
  }
}
