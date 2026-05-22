import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel extends Equatable {
  final String id;

  @JsonKey(name: 'user_id')
  final String userId;

  @JsonKey(name: 'user_name', includeFromJson: false, includeToJson: false)
  final String? userName;

  @JsonKey(name: 'user_avatar', includeFromJson: false, includeToJson: false)
  final String? userAvatar;

  final String content;

  @JsonKey(name: 'image_urls')
  final List<String> imageUrls;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'love_count')
  final int loveCount;

  @JsonKey(name: 'comments_count')
  final int commentsCount;

  @JsonKey(name: 'shares_count')
  final int sharesCount;

  @JsonKey(name: 'is_liked')
  final bool isLikedByCurrentUser;

  const PostModel({
    required this.id,
    required this.userId,
    this.userName,
    this.userAvatar,
    required this.content,
    this.imageUrls = const [],
    required this.createdAt,
    this.loveCount = 0,
    this.commentsCount = 0,
    this.sharesCount = 0,
    this.isLikedByCurrentUser = false,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);

  PostModel copyWith({
    String? id,
    String? userId,
    String? userName,
    String? userAvatar,
    String? content,
    List<String>? imageUrls,
    DateTime? createdAt,
    int? loveCount,
    int? commentsCount,
    int? sharesCount,
    bool? isLikedByCurrentUser,
  }) {
    return PostModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userAvatar: userAvatar ?? this.userAvatar,
      content: content ?? this.content,
      imageUrls: imageUrls ?? this.imageUrls,
      createdAt: createdAt ?? this.createdAt,
      loveCount: loveCount ?? this.loveCount,
      commentsCount: commentsCount ?? this.commentsCount,
      sharesCount: sharesCount ?? this.sharesCount,
      isLikedByCurrentUser: isLikedByCurrentUser ?? this.isLikedByCurrentUser,
    );
  }

  @override
  List<Object?> get props => [
    id,
    userId,
    userName,
    userAvatar,
    content,
    imageUrls,
    createdAt,
    loveCount,
    commentsCount,
    sharesCount,
    isLikedByCurrentUser,
  ];
}
