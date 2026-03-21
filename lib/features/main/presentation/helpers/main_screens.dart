import 'package:flutter/material.dart';

import '../../../Community/presentation/views/community_view.dart';
import '../../../chatbot/presentation/views/chatbot_view.dart';
import '../../../meditations/presentation/views/meditations_view.dart';
import '../widgets/home_providers_wrapper.dart';
import '../widgets/profile_providers_wrapper.dart';

class MainScreens {
  static List<Widget> build({required bool isPremium}) {
    return [
      HomeProvidersWrapper(isPremium: isPremium),
      CommunityView(key: const ValueKey('community'), isPremium: isPremium),
      MeditationsView(key: const ValueKey('meditations'), isPremium: isPremium),
      ChatbotView(key: const ValueKey('chatbot'), isPremium: isPremium),
      ProfileProvidersWrapper(isPremium: isPremium,),
    ];
  }
}

