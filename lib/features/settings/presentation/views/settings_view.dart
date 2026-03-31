import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_appbar.dart';
import '../widgets/settings/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  final bool isPremium;
  const SettingsView({super.key, required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar(
        title: "Settings",
        isPremium: isPremium,
        onTap: () {},
      ),
      body: const SettingsViewBody(),
    );
  }
}
