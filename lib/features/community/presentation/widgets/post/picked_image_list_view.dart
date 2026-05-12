import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/create_post_cubit/create_post_cubit.dart';
import 'picked_image_item.dart';

class PickedImageListView extends StatelessWidget {
  final CreatePostState state;

  const PickedImageListView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreatePostCubit>();
    return Expanded(
      child: SizedBox(
        height: 58,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: state.selectedImages.length,
          separatorBuilder: (_, __) => const SizedBox(width: 10),
          itemBuilder: (context, index) {
            return PickedImageItem(
              imageFile: state.selectedImages[index],
              onRemove: () => cubit.removeImageAt(index),
            );
          },
        ),
      ),
    );
  }
}
