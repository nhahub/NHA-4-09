import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/custom_floating_action_button.dart';

class AddCommunityPostButton extends StatelessWidget {
  const AddCommunityPostButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: CustomFloatingActionButton(
        onTap: () {
          context.push(Routes.addCommunityPostView);
        },
      ),
    );
  }
}
