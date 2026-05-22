import '../post_model.dart';

class DummyPosts {
  static final posts = List<PostModel>.generate(
    3,
    (i) => PostModel(
      id: '__loading__$i',
      userId: '',
      userName: ' ',
      userAvatar: '',
      content: ' ',
      createdAt: DateTime.now(),
    ),
  );
}
