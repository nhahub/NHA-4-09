import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../domain/entities/settings_action_type.dart';
import '../helpers/logout_dialog.dart';

void handleSettingsAction({
  required BuildContext context,
  required SettingsActionType action,
}) {
  switch (action) {
    case SettingsActionType.myAccount:
      context.push(Routes.editProfileView);
      break;

    case SettingsActionType.rateUs:
      break;

    case SettingsActionType.subscription:
      context.push(Routes.subscriptionManagementView);
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

    case SettingsActionType.logout:
      logoutDialog(context);
      break;
  }
}
