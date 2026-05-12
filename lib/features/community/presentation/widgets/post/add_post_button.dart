import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../manager/create_post_cubit/create_post_cubit.dart';

class AddPostButton extends StatelessWidget {
  final CreatePostState state;

  const AddPostButton({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreatePostCubit>();
    final bool canPost = state.canPost && !state.status.isSubmitting;
    return TextButton(
      onPressed: canPost ? cubit.submitPost : null,
      style: TextButton.styleFrom(
        minimumSize: const Size(74, 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: canPost
            ? AppColors.buttonBlack
            : const Color(0xFFE9EAEE),
        foregroundColor: canPost ? Colors.white : const Color(0xFFB6BAC5),
      ),
      child: cubit.state.status.isSubmitting
          ? const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(color: Colors.white),
            )
          : const Text('Post', style: AppStyles.bold15),
    );
  }
}
