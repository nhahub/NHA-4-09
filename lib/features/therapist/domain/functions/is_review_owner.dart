import '../../../../core/functions/user_data_local.dart';
import '../../data/models/therapist_review_model.dart';

bool isReviewOwner(TherapistReviewModel review) {
  final currentUserId = getUser()?.userId;
  if (currentUserId == null) return false;
  return review.userId == currentUserId;
}
