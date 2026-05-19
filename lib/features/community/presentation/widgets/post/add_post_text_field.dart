import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../manager/create_post_cubit/create_post_cubit.dart';

class AddPostTextField extends StatelessWidget {
  const AddPostTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreatePostCubit>();

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF8F8FB),
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Color(0x110B1324),
              blurRadius: 20,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: SizedBox(
          width: double.infinity,
          child: TextField(
            onChanged: cubit.onTextChanged,
            expands: true,
            minLines: null,
            maxLines: null,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              hintText: "What's on your mind?",
              hintStyle: AppStyles.medium20.copyWith(color: AppColors.bodyGray),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(24),
            ),
            style: AppStyles.medium20,
          ),
        ),
      ),
    );
  }
}
