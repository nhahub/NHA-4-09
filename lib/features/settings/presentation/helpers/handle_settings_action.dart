import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../domain/entities/settings_action_type.dart';
import '../manager/update_profile_cubit/update_profile_cubit.dart';
import 'show_feedback_bottom_sheet.dart';
import 'show_logout_bottom_sheet.dart';
import 'show_upgrade_subscription_bottom_sheet.dart';

void handleSettingsAction({
  required BuildContext context,
  required SettingsActionType action,
}) {
  switch (action) {
    case SettingsActionType.myAccount:
      final cubit = context.read<UpdateProfileCubit>();
      context.push(Routes.editProfileView, args: cubit);
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
