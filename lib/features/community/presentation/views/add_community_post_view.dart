import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/app_colors.dart';
import '../manager/create_post_cubit/create_post_cubit.dart';

class AddCommunityPostView extends StatelessWidget {
  const AddCommunityPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreatePostCubit, CreatePostState>(
      listener: (context, state) {
        if (state.status == CreatePostStatus.success) {
          Navigator.pop(context, true);
        } else if (state.status == CreatePostStatus.failure &&
            state.errorMessage != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        }
      },
      builder: (context, state) {
        final cubit = context.read<CreatePostCubit>();
        final canPost =
            state.canPost && state.status != CreatePostStatus.submitting;

        return Scaffold(
          backgroundColor: const Color(0xFFF3F4F7),
          appBar: AppBar(
            backgroundColor: const Color(0xFFF3F4F7),
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, color: Colors.black),
            ),
            title: const Text(
              'Create Post',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: TextButton(
                  onPressed: canPost ? cubit.submitPost : null,
                  style: TextButton.styleFrom(
                    minimumSize: const Size(74, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: canPost
                        ? AppColors.buttonBlack
                        : const Color(0xFFE9EAEE),
                    foregroundColor: canPost
                        ? Colors.white
                        : const Color(0xFFB6BAC5),
                  ),
                  child: state.status == CreatePostStatus.submitting
                      ? const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Post',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
              child: Column(
                children: [
                  _UserInfoCard(
                    userName: state.userData?.name,
                    userImage: state.userData?.picture,
                  ),
                  const SizedBox(height: 18),
                  Expanded(
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
                          decoration: const InputDecoration(
                            hintText: "What's on your mind?",
                            hintStyle: TextStyle(
                              color: Color(0xFF9EA3AF),
                              fontSize: 28,
                              fontWeight: FontWeight.w400,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(24),
                          ),
                          style: const TextStyle(
                            fontSize: 20,
                            height: 1.35,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _PhotoAddButton(
                        onTap:
                            state.selectedImages.length >=
                                CreatePostState.maxImages
                            ? null
                            : cubit.pickImages,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SizedBox(
                          height: 58,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.selectedImages.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(width: 10),
                            itemBuilder: (context, index) {
                              return _PickedImageItem(
                                imageFile: state.selectedImages[index],
                                onRemove: () => cubit.removeImageAt(index),
                              );
                            },
                          ),
                        ),
                      ),
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

class _UserInfoCard extends StatelessWidget {
  final String? userName;
  final String? userImage;

  const _UserInfoCard({this.userName, this.userImage});

  @override
  Widget build(BuildContext context) {
    final normalizedName = (userName ?? 'user').trim();
    final avatarUrl = userImage ?? '';
    final firstLetter = normalizedName.isNotEmpty
        ? normalizedName[0].toUpperCase()
        : 'U';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8FB),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x140B1324),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          avatarUrl.isNotEmpty
              ? CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(avatarUrl),
                )
              : CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.transparent,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Color(0xFF8C6BFF), Color(0xFFD46BEA)],
                      ),
                    ),
                    child: SizedBox(
                      width: 56,
                      height: 56,
                      child: Center(
                        child: Text(
                          firstLetter,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '@$normalizedName',
                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              const SizedBox(height: 2),
              const Text(
                'Share your thoughts',
                style: TextStyle(
                  color: Color(0xFF9EA3AF),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PickedImageItem extends StatelessWidget {
  final File imageFile;
  final VoidCallback onRemove;

  const _PickedImageItem({required this.imageFile, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.file(
            imageFile,
            width: 78,
            height: 58,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: -6,
          top: -6,
          child: InkWell(
            onTap: onRemove,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.close, size: 12, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class _PhotoAddButton extends StatelessWidget {
  final VoidCallback? onTap;
  const _PhotoAddButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
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
              color: onTap == null ? const Color(0xFFBFC4CF) : Colors.black87,
            ),
            const SizedBox(width: 8),
            Text(
              'Photo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: onTap == null ? const Color(0xFFBFC4CF) : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
