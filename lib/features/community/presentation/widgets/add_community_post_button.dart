import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/custom_floating_action_button.dart';
import '../manager/community_feed_cubit/community_feed_cubit.dart';

class AddCommunityPostButton extends StatelessWidget {
  const AddCommunityPostButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: CustomFloatingActionButton(
        onTap: () async {
          final result = await context.push(Routes.addCommunityPostView);
          if (result == true && context.mounted) {
            context.read<CommunityFeedCubit>().getPosts();
          }
        },
      ),
    );
  }
}
