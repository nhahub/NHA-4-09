import 'package:flutter/material.dart';
import 'package:moodly/features/settings/presentation/helpers/show_upgrade_subscription_bottom_sheet.dart';
import 'show_feedback_bottom_sheet.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../domain/entities/settings_action_type.dart';
import 'show_logout_bottom_sheet.dart';

void handleSettingsAction({
  required BuildContext context,
  required SettingsActionType action,
}) {
  switch (action) {
    case SettingsActionType.myAccount:
      context.push(Routes.editProfileView);
      break;

    case SettingsActionType.privacy:
      context.push(Routes.privacyPolicyView);
      break;

    case SettingsActionType.terms:
      context.push(Routes.termsAndConditionsView);
      break;

    case SettingsActionType.about:
      context.push(Routes.aboutView);
      break;

    case SettingsActionType.subscription:
      showUpgradeSubscriptionBottomSheet(context: context);
      break;

    case SettingsActionType.rateUs:
      showFeedbackBottomSheet(context: context);
      break;

    case SettingsActionType.logout:
      showLogoutBottomSheet(context);
      break;
  }
}
