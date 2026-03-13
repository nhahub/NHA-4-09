import '../../../../core/constants/constants.dart';
import '../../../../core/services/supabase_crud_service.dart';

class TherapistRatingService {
  final SupabaseCRUDService supabaseCRUDService;

  TherapistRatingService({required this.supabaseCRUDService});

  Future<List<Map<String, dynamic>>> getRatings({
    required String therapistId,
  }) async {
    final data = await supabaseCRUDService.getData(
      table: kTherapistRatingsTable,
      filters: {'therapist_id': therapistId},
      orderBy: 'created_at',
      ascending: false,
    );
    return data.isNotEmpty ? data : [];
  }

  Future<void> addRating({required Map<String, dynamic> data}) {
    return supabaseCRUDService.addData(
      table: kTherapistRatingsTable,
      data: data,
    );
  }

  Stream<List<Map<String, dynamic>>> listenToRatings({
    required String therapistId,
  }) {
    return supabaseCRUDService.listenToTable(
      table: kTherapistRatingsTable,
      primaryKey: ['id'],
      filters: {'therapist_id': therapistId},
      orderBy: 'created_at',
      ascending: false,
    );
  }

  Future<Map<String, dynamic>> getRatingSummary(String therapistId) async {
    final res = await supabaseCRUDService.client.rpc(
      'get_therapist_rating_summary',
      params: {'t_id': therapistId},
    );

    return Map<String, dynamic>.from(res);
  }
}
