import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:moodly/features/payment/presentation/views/premium_view.dart';

import '../../core/routing/app_router.dart';
import '../../core/routing/navigation_service.dart';
import '../../core/routing/routes.dart';
import '../../core/theming/theme_manager.dart';

class MoodlyApp extends StatelessWidget {
  const MoodlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.getAppTheme(),
      onGenerateRoute: AppRouter.generateRoute,

      home: PremiumView(withClose: false),

      initialRoute: Routes.root,
    );
  }
}
