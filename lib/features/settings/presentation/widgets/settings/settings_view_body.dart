import 'package:flutter/material.dart';

import '../../../../../core/enums/fade_position.dart';
import '../../../../../core/widgets/fade_scrollable.dart';
import 'settings_section.dart';
import 'user_account_list_tile.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const FadeScrollable(
      fadePosition: FadePosition.top,
      child: SingleChildScrollView(
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            UserAccountListTile(),
            SettingsSection(),
          ],
        ),
      ),
    );
  }
}
