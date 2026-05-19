import 'package:flutter/material.dart';

import 'settings_section.dart';
import 'user_account_list_tile.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [UserAccountListTile(), SettingsSection()],
      ),
    );
  }
}
