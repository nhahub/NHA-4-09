import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/constants/constants.dart';
import '../parsers/community_user_join.dart';

part 'comment_model.g.dart';

@JsonSerializable()
class CommentModel extends Equatable {
  final String id;

  @JsonKey(name: 'post_id')
  final String postId;

  @JsonKey(name: 'user_id')
  final String userId;

  @JsonKey(name: 'parent_id')
  final String? parentId;

  final String content;

  @JsonKey(
    name: 'created_at',
    fromJson: _dateTimeFromJson,
    toJson: _dateTimeToJson,
  )
  final DateTime createdAt;

  @JsonKey(name: 'likes_count', defaultValue: 0)
  final int likesCount;

  @JsonKey(name: 'replies_count', defaultValue: 0)
  final int repliesCount;

  @JsonKey(includeFromJson: false, includeToJson: false)
  final bool isLikedByMe;

  @JsonKey(includeFromJson: false, includeToJson: false)
  final String userName;

  @JsonKey(includeFromJson: false, includeToJson: false)
  final String userAvatar;

  const CommentModel({
    required this.id,
    required this.postId,
    required this.userId,
    this.parentId,
    required this.content,
    required this.createdAt,
    this.likesCount = 0,
    this.repliesCount = 0,
    this.isLikedByMe = false,
    this.userName = 'Unknown User',
    this.userAvatar = kImagePlaceHolder,
  });

  factory CommentModel.fromJson(
    Map<String, dynamic> json, {
    bool isLikedByMe = false,
  }) {
    final base = _$CommentModelFromJson(json);

    final joined = communityUserJoinRow(json);

    return base.copyWith(
      isLikedByMe: isLikedByMe,
      userName: (joined?['name'] ?? 'Unknown User').toString(),
      userAvatar: (joined?['picture'] ?? kImagePlaceHolder).toString(),
    );
  }

  Map<String, dynamic> toJson() => _$CommentModelToJson(this);

  CommentModel copyWith({
    String? id,
    String? postId,
    String? userId,
    String? parentId,
    String? content,
    DateTime? createdAt,
    int? likesCount,
    int? repliesCount,
    bool? isLikedByMe,
    String? userName,
    String? userAvatar,
  }) {
    return CommentModel(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      userId: userId ?? this.userId,
      parentId: parentId ?? this.parentId,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      likesCount: likesCount ?? this.likesCount,
      repliesCount: repliesCount ?? this.repliesCount,
      isLikedByMe: isLikedByMe ?? this.isLikedByMe,
      userName: userName ?? this.userName,
      userAvatar: userAvatar ?? this.userAvatar,
    );
  }

  static DateTime _dateTimeFromJson(String date) =>
      DateTime.parse(date).toLocal();

  static String _dateTimeToJson(DateTime date) =>
      date.toUtc().toIso8601String();

  @override
  List<Object?> get props => [
    id,
    postId,
    userId,
    parentId,
    content,
    createdAt,
    likesCount,
    repliesCount,
    isLikedByMe,
    userName,
    userAvatar,
  ];
}
