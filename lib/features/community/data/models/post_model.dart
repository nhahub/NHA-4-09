class PostModel {
  final String id;
  final String userId;
  final String userName;
  final String userImage;
  final String content;
  final List<String> imageUrls;
  final DateTime createdAt;
  final int loveCount;
  final int commentsCount;
  final int sharesCount;
  final bool isLikedByCurrentUser;

  const PostModel({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.content,
    this.imageUrls = const [],
    required this.createdAt,
    this.loveCount = 0,
    this.commentsCount = 0,
    this.sharesCount = 0,
    this.isLikedByCurrentUser = false,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: (json['id'] ?? '').toString(),
      userId: (json['user_id'] ?? json['userId'] ?? '').toString(),
      userName: (json['user_name'] ?? json['userName'] ?? '').toString(),
      userImage: (json['user_image'] ?? json['userImage'] ?? '').toString(),
      content: (json['content'] ?? '').toString(),
      imageUrls: (json['image_urls'] as List<dynamic>? ?? json['imageUrls'] as List<dynamic>? ?? const [])
          .map((e) => e.toString())
          .toList(),
      createdAt:
          DateTime.tryParse((json['created_at'] ?? json['createdAt'] ?? '').toString()) ??
          DateTime.now(),
      loveCount:
          ((json['love_count'] ?? json['loveCount'] ?? json['likes_count'] ?? 0)
                  as num)
              .toInt(),
      commentsCount:
          ((json['comments_count'] ?? json['commentsCount'] ?? 0) as num).toInt(),
      sharesCount:
          ((json['shares_count'] ?? json['sharesCount'] ?? 0) as num).toInt(),
      isLikedByCurrentUser: (json['is_liked'] ?? json['isLikedByCurrentUser'] ?? false) as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'user_name': userName,
      'user_image': userImage,
      'content': content,
      'image_urls': imageUrls,
      'created_at': createdAt.toIso8601String(),
      'love_count': loveCount,
      'comments_count': commentsCount,
      'shares_count': sharesCount,
      'is_liked': isLikedByCurrentUser,
    };
  }

  PostModel copyWith({
    String? id,
    String? userId,
    String? userName,
    String? userImage,
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
      userImage: userImage ?? this.userImage,
      content: content ?? this.content,
      imageUrls: imageUrls ?? this.imageUrls,
      createdAt: createdAt ?? this.createdAt,
      loveCount: loveCount ?? this.loveCount,
      commentsCount: commentsCount ?? this.commentsCount,
      sharesCount: sharesCount ?? this.sharesCount,
      isLikedByCurrentUser: isLikedByCurrentUser ?? this.isLikedByCurrentUser,
    );
  }
}
