import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/services/get_it_service.dart';
import '../../../data/models/post_model.dart';
import '../../../data/repos/comments_repo.dart';
import '../../../data/services/community_comments_remote_service.dart';
import '../../manager/comments_cubit/comments_cubit.dart';
import 'comments_bottom_sheet_view.dart';

class CommentsBottomSheet extends StatelessWidget {
  final PostModel post;

  const CommentsBottomSheet({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CommentsCubit(repo: getIt<CommentsRepo>())..loadComments(post.id),
      child: _CommentsRealtimeScope(
        postId: post.id,
        child: CommentsBottomSheetView(post: post),
      ),
    );
  }
}

class _CommentsRealtimeScope extends StatefulWidget {
  final String postId;
  final Widget child;

  const _CommentsRealtimeScope({required this.postId, required this.child});

  @override
  State<_CommentsRealtimeScope> createState() => _CommentsRealtimeScopeState();
}

class _CommentsRealtimeScopeState extends State<_CommentsRealtimeScope> {
  Timer? _debounce;
  RealtimeChannel? _channel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final remote = getIt<CommunityCommentsRemoteService>();
      _channel = remote.subscribeToPostComments(widget.postId, _onRemoteChange);
    });
  }

  void _onRemoteChange() {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 320), () {
      if (!mounted) return;
      context.read<CommentsCubit>().loadComments(widget.postId);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    final ch = _channel;
    if (ch != null) {
      getIt<CommunityCommentsRemoteService>().removeChannel(ch);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
