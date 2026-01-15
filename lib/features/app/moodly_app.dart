import 'package:flutter/material.dart';

import '../../core/routing/app_router.dart';
import '../../core/theming/theme_manager.dart';

class MoodlyApp extends StatelessWidget {
  const MoodlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.getAppTheme(),
      routerConfig: AppRouter.createRouter(),
    );
  }
}
