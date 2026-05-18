import 'package:flutter/material.dart';

import '../widgets/settings/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  final bool isPremium;
  const SettingsView({super.key, required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SettingsViewBody(),
    );
  }
}
