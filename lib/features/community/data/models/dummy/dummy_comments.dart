import 'package:moodly/features/community/data/models/comment_model.dart';

class DummyComments {
  static List<CommentModel> dummyComments = List.generate(
    6,
    (index) => CommentModel(
      id: "",
      postId: "",
      userId: "",
      content: "",
      createdAt: DateTime.now(),
      userName: "",
      userAvatar: "",
    ),
  );
}
