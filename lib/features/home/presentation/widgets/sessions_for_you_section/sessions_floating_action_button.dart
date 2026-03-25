import 'package:flutter/material.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/widgets/custom_floating_action_button.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';

class SessionsFloatingActionButton extends StatelessWidget {
  const SessionsFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: CustomFloatingActionButton(
        icon: AppAssets.meetingIcon,
        onTap: () {
          context.push(Routes.allBookingSessionsView);
        },
      ),
    );
  }
}
