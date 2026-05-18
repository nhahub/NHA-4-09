import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_appbar.dart';

class MainAppBars {
  static List<PreferredSizeWidget?> appBars({required bool isPremium}) {
    return [
      CustomAppbar(title: "Home", isPremium: isPremium),
      CustomAppbar(title: "Community", isPremium: isPremium),
      CustomAppbar(title: "Meditations", isPremium: isPremium),
      CustomAppbar(title: 'Chat with Moodly', isPremium: isPremium),
      CustomAppbar(title: "Settings", isPremium: isPremium),
    ];
  }
}
