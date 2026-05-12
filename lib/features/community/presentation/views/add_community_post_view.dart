import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/functions/error_dialog.dart';
import 'package:moodly/features/community/presentation/widgets/post/add_post_text_field.dart';
import 'package:moodly/features/home/presentation/widgets/shared/back_button_appbar.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../manager/create_post_cubit/create_post_cubit.dart';
import '../widgets/post/add_photo_button.dart';
import '../widgets/post/add_post_button.dart';
import '../widgets/post/picked_image_list_view.dart';
import '../widgets/post/user_info_card.dart';

class AddCommunityPostView extends StatelessWidget {
  const AddCommunityPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreatePostCubit, CreatePostState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          context.pop(true);
        } else if (state.status.isFailure) {
          errorDialog(context: context, message: state.errorMessage!);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFFF3F4F7),
          appBar: BackButtonAppbar(
            backgroundColor: const Color(0xFFF3F4F7),
            title: 'Create Post',
            withFade: false,
            actionButton: AddPostButton(state: state),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kAppHorizontalPadding,
              ),
              child: Column(
                spacing: 18,
                children: [
                  const UserInfoCard(),
                  const AddPostTextField(),
                  Row(
                    spacing: 12,
                    children: [
                      AddPhotoButton(state: state),
                      PickedImageListView(state: state),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
