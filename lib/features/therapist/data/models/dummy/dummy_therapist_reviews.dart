import '../therapist_review_model.dart';
import '../../../../../core/theming/app_assets.dart';

class DummyTherapistReviews {
  static List<TherapistReviewModel> dummyReviews = List.generate(
    5,
    (index) => TherapistReviewModel(
      id: "rating_$index",
      therapistId: "therapist_${index % 3}",
      userId: "user_$index",
      rating: (3 + index % 3) + 0.5 * (index % 2),
      review: "This therapist is very helpful and understanding. Review $index",
      userName: "User $index",
      userAvatar: AppAssets.dummyImage,
      createdAt: DateTime.now().subtract(Duration(days: index * 2)),
    ),
  );
}
