import 'package:moodly/features/home/data/models/activity/activity_model.dart';

class DummyActivities {
  static List<ActivityModel> dummyActivities = List.generate(
    5,
    (index) => const ActivityModel(
      id: "",
      title: "",
      description: "",
      imageUrl: "",
      duration: 0,
      categoryId: "",
    ),
  );
}
