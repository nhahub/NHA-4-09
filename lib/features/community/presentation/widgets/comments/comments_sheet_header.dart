import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../manager/comments_cubit/comments_cubit.dart';
import '../../manager/comments_cubit/comments_state.dart';

class CommentsSheetHeader extends StatelessWidget {
  const CommentsSheetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<CommentsCubit, CommentsState>(
            builder: (context, state) {
              int count = 0;
              if (state.status.isSuccess) {
                count =
                    (state.comments?.length ?? 0) +
                    (state.replies?.values.fold(
                          0,
                          (sum, replies) => sum! + replies.length,
                        ) ??
                        0);
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Comments',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '$count comments',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.bodyGray,
                    ),
                  ),
                ],
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () => context.pop(),
          ),
        ],
      ),
    );
  }
}
