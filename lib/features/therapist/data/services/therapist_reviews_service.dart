import '../../../../core/constants/constants.dart';
import '../../../../core/services/supabase_crud_service.dart';

class TherapistReviewsService {
  final SupabaseCRUDService supabaseCRUDService;

  TherapistReviewsService({required this.supabaseCRUDService});

  Future<List<Map<String, dynamic>>> getReviews({
    required String therapistId,
  }) async {
    final data = await supabaseCRUDService.getData(
      table: kTherapistReviewsTable,
      filters: {'therapist_id': therapistId},
      orderBy: 'created_at',
      ascending: false,
    );
    return data.isNotEmpty ? data : [];
  }

  Future<void> addReview({required Map<String, dynamic> data}) {
    return supabaseCRUDService.addData(
      table: kTherapistReviewsTable,
      data: data,
    );
  }

  Future<void> updateReview({
    required String ratingId,
    required Map<String, dynamic> updatedData,
  }) {
    return supabaseCRUDService.updateData(
      table: kTherapistReviewsTable,
      data: updatedData,
      idColumn: 'id',
      idValue: ratingId,
    );
  }

  Future<void> deleteReview({required String ratingId}) {
    return supabaseCRUDService.deleteData(
      table: kTherapistReviewsTable,
      idColumn: 'id',
      idValue: ratingId,
    );
  }
}
