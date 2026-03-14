import '../../../../core/services/supabase_crud_service.dart';
import '../models/therapist_model.dart';

class TherapistService {
  final SupabaseCRUDService supabaseCRUDService;
  TherapistService({required this.supabaseCRUDService});

  Future<List<TherapistModel>> getTherapists() async {
    final data = await supabaseCRUDService.client
        .from('therapists_with_rating')
        .select();

    return (data as List)
        .map((row) => TherapistModel.fromJson(row as Map<String, dynamic>))
        .toList();
  }
}
