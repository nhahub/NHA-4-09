import '../../../../core/functions/get_user.dart';
import '../../data/models/therapist_review_model.dart';

double calculateAverageRating(List<TherapistReviewModel> reviews) {
  if (reviews.isEmpty) return 0.0;
  final total = reviews.map((e) => e.rating).reduce((a, b) => a + b);
  return total / reviews.length;
}

bool hasUserRated(List<TherapistReviewModel> reviews) {
  final userId = getUser()?.userId;
  if (userId == null) return false;
  return reviews.any((r) => r.userId == userId);
}
