import 'package:flutter/material.dart';
import '../helpers/handle_settings_action.dart';
import 'custom_settings_tile.dart';
import '../../../../core/theming/app_styles.dart';
import '../helpers/settings_items_provider.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        const Text("Settings", style: AppStyles.extraBold20),
        ...getSettingsItems().map(
          (item) => CustomSettingsTile(
            onTap: () {
              handleSettingsAction(context: context, action: item.action);
            },
            title: item.title,
            icon: item.icon,
            iconColor: item.iconColor,
            iconSize: item.iconSize,
            iconBackGroundColor: item.iconBackgroundColor,
          ),
        ),
      ],
    );
  }
}
