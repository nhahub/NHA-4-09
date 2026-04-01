import 'package:uuid/uuid.dart';

import '../../../../core/functions/get_user.dart';
import '../../data/models/therapist_review_model.dart';

TherapistReviewModel createTherapistReview({
  required String therapistId,
  required String reviewText,
  required num rating,
  bool displayAnonymously = false,
  DateTime? createdAt,
  String? id,
}) {
  const uuid = Uuid();
  final user = getUser()!;
  return TherapistReviewModel(
    id: id ?? uuid.v4(),
    therapistId: therapistId,
    userId: user.userId,
    userName: displayAnonymously ? 'Anonymous' : user.name ?? '',
    userAvatar: displayAnonymously ? null : user.picture,
    rating: rating.toInt(),
    review: reviewText,
    createdAt: createdAt ?? DateTime.now(),
  );
}
