import 'package:flutter/material.dart';

import '../widgets/chatbot_providers_wrapper.dart';
import '../widgets/community_providers_wrapper.dart';
import '../widgets/home_providers_wrapper.dart';
import '../widgets/meditations_providers_wrapper.dart';
import '../widgets/settings_providers_wrapper.dart';

class MainScreens {
  static List<Widget> build({required bool isPremium}) {
    return [
      HomeProvidersWrapper(isPremium: isPremium),
      CommunityProvidersWrapper(isPremium: isPremium),
      MeditationsProvidersWrapper(isPremium: isPremium),
      ChatbotProvidersWrapper(isPremium: isPremium),
      SettingsProvidersWrapper(isPremium: isPremium),
    ];
  }
}
