class PostModel {
  final String id;
  final String userName;
  final String userAvatar;
  final String content;
  final DateTime createdAt;
  final int likes;
  final int comments;
  final int sharesCount;
  final bool isPremium;
  final bool isLiked;
  final List<String> images;

  const PostModel({
    required this.id,
    required this.userName,
    required this.userAvatar,
    required this.content,
    required this.createdAt,
    required this.likes,
    required this.comments,
    this.sharesCount = 0,
    required this.isPremium,
    this.isLiked = false,
    required this.images,
  });
}
