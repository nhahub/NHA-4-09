import '../post_model.dart';

class DummyPosts {
  static List<PostModel> dummyPosts = List.generate(
    6,
    (index) => PostModel(
      id: "",
      userId: '',
      userName: '',
      userImage: '',
      content: '',
      createdAt: DateTime.now(),
    ),
  );
}
