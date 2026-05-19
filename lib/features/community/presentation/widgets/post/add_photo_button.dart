import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../manager/create_post_cubit/create_post_cubit.dart';

class AddPhotoButton extends StatelessWidget {
  final CreatePostState state;
  const AddPhotoButton({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreatePostCubit>();
    final onTap = state.selectedImages.length >= CreatePostState.maxImages
        ? null
        : cubit.pickImages;
        
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 58,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F8FB),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFE8EAF0)),
        ),
        child: Row(
          children: [
            Icon(
              Icons.image_outlined,
              color: onTap == null
                  ? const Color(0xFFBFC4CF)
                  : AppColors.bodyGray,
            ),
            const SizedBox(width: 8),
            Text(
              'Photo',
              style: AppStyles.semiBold17.copyWith(
                color: onTap == null
                    ? const Color(0xFFBFC4CF)
                    : AppColors.bodyGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
