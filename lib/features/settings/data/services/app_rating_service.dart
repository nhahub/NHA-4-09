import '../../../../core/constants/constants.dart';
import '../../../../core/functions/user_data_local.dart';
import '../../../../core/services/supabase_crud_service.dart';
import '../models/app_rating_model.dart';

class AppRatingService {
  final SupabaseCRUDService supabaseCRUDService;

  AppRatingService({required this.supabaseCRUDService});

  Future<void> submitRating({required AppRatingModel appRatingModel}) async {
    await supabaseCRUDService.upsertData(
      table: kAppRatingsTable,
      onConflict: 'user_id',
      data: appRatingModel.toJson(),
    );
  }

  Future<AppRatingModel?> getUserRating() async {
    final res = await supabaseCRUDService.getSingleRow(
      table: kAppRatingsTable,
      whereColumn: 'user_id',
      whereValue: getUser()!.userId,
    );
    if (res == null) return null;
    return AppRatingModel.fromJson(res);
  }
}
