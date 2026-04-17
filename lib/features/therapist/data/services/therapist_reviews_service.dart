import '../models/therapist_review_model.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/services/supabase_crud_service.dart';

class TherapistReviewsService {
  final SupabaseCRUDService _supabaseCRUDService;

  TherapistReviewsService({required SupabaseCRUDService supabaseCRUDService})
    : _supabaseCRUDService = supabaseCRUDService;

  Future<List<TherapistReviewModel>> getReviews({
    required String therapistId,
  }) async {
    final List<Map<String, dynamic>> data = await _supabaseCRUDService.getData(
      table: kTherapistReviewsTable,
      filters: {'therapist_id': therapistId},
      orderBy: 'created_at',
      ascending: false,
    );

    data.isEmpty ? [] : data;
    final List<TherapistReviewModel> ratings = data
        .map((e) => TherapistReviewModel.fromJson(e))
        .toList();

    return ratings;
  }

  Future<void> addReview({required Map<String, dynamic> data}) async {
    await _supabaseCRUDService.addData(
      table: kTherapistReviewsTable,
      data: data,
    );
  }

  Future<void> updateReview({
    required String ratingId,
    required Map<String, dynamic> updatedData,
  }) {
    return _supabaseCRUDService.updateData(
      table: kTherapistReviewsTable,
      data: updatedData,
      idColumn: 'id',
      idValue: ratingId,
    );
  }

  Future<void> deleteReview({required String ratingId}) {
    return _supabaseCRUDService.deleteData(
      table: kTherapistReviewsTable,
      idColumn: 'id',
      idValue: ratingId,
    );
  }
}
