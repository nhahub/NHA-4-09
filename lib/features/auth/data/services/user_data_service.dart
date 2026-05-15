import '../../../../core/constants/constants.dart';
import '../../../../core/models/user_data_model.dart';
import '../../../../core/services/supabase_crud_service.dart';

class UserDataService {
  final SupabaseCRUDService _supabaseCRUDService;

  UserDataService({required SupabaseCRUDService supabaseCRUDService})
    : _supabaseCRUDService = supabaseCRUDService;

  Future<UserDataModel> updateUserData({
    required UserDataModel userDataModel,
  }) async {
    final Map<String, dynamic> userData = await _supabaseCRUDService
        .upsertDataAndReturnRow(
          table: kUserDataTable,
          data: userDataModel.toJson(),
          onConflict: 'id',
        );
    return UserDataModel.fromJson(userData);
  }

  Future<void> updateUserFields({
    String? name,
    String? phone,
    String? picture,
    bool? isOldUser,
  }) async {
    await _supabaseCRUDService.updateData(
      table: kUserDataTable,
      data: {
        if (name != null) 'name': name,
        if (phone != null) 'phone': phone,
        if (picture != null) 'picture': picture,
        if (isOldUser != null) 'is_old_user': isOldUser,
      },
      idColumn: 'id',
      idValue: _supabaseCRUDService.getCurrentUserId(),
    );
  }

  Future<UserDataModel?> getUserData({required String userId}) async {
    final Map<String, dynamic>? userData = await _supabaseCRUDService
        .getSingleRow(table: kUserDataTable, filters: {"id": userId});

    return UserDataModel?.fromJson(userData!);
  }

  Future<bool> isUserExists() async {
    final bool response = await _supabaseCRUDService.isRowExists(
      table: kUserDataTable,
      column: "id",
      value: _supabaseCRUDService.getCurrentUserId(),
    );
    return response;
  }
}
