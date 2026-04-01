import 'package:flutter/material.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../data/models/settings_item_model.dart';
import '../../domain/entities/settings_action_type.dart';

List<SettingsItemModel> getSettingsItems() {
  return const [
    SettingsItemModel(
      title: "My Account",
      icon: AppAssets.profileIcon,
      action: SettingsActionType.myAccount,
    ),

    SettingsItemModel(
      title: "Privacy Policy",
      icon: AppAssets.privacyPolicyIcon,
      action: SettingsActionType.privacy,
      iconSize: 20,
    ),
    SettingsItemModel(
      title: "Terms & Conditions",
      icon: AppAssets.termsAndConditionsIcon,
      action: SettingsActionType.terms,
      iconSize: 20,
    ),
    SettingsItemModel(
      title: "About",
      icon: AppAssets.aboutIcon,
      action: SettingsActionType.about,
    ),
    SettingsItemModel(
      title: "Upgrade Subscription",
      icon: AppAssets.subscriptionIcon,
      action: SettingsActionType.subscription,
      iconSize: 18,
      withTrailing: false,
    ),
    SettingsItemModel(
      title: "Rate Us",
      icon: AppAssets.rateIcon,
      action: SettingsActionType.rateUs,
      withTrailing: false,
    ),
    SettingsItemModel(
      title: "Log Out",
      icon: AppAssets.logoutIcon,
      action: SettingsActionType.logout,
      withTrailing: false,
      iconColor: Colors.red,
      iconSize: 16,
      iconBackgroundColor: AppColors.moreLighterRed,
    ),
  ];
}
