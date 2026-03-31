import 'package:flutter/material.dart';

import '../../../settings/presentation/views/settings_view.dart';

class SettingsProvidersWrapper extends StatelessWidget {
  final bool isPremium;
  const SettingsProvidersWrapper({super.key, required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return SettingsView(key: const ValueKey('Settings'), isPremium: isPremium);
  }
}
