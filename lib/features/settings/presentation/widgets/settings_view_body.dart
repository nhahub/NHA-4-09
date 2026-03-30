import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/features/settings/presentation/widgets/user_account_list_tile.dart';
import '../../../../core/enums/fade_position.dart';
import '../../../../core/widgets/fade_scrollable.dart';
import 'settings_section.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const FadeScrollable(
      fadePosition: FadePosition.top,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
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
      ),
    );
  }
}
