import '../../../../core/models/user_data_model.dart';
import 'user_data_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/functions/user_data_local.dart';
import '../services/supabase_auth_service.dart';

class AuthRepo {
  final SupabaseAuthService _supabaseAuthService;
  final UserDataRepo _userDataRepo;

  AuthRepo({
    required SupabaseAuthService supabaseAuthService,
    required UserDataRepo userDataRepo,
  }) : _supabaseAuthService = supabaseAuthService,
       _userDataRepo = userDataRepo;

  Future<UserDataModel> loginWithEmail({
    required String email,
    required String password,
  }) async {
    await _supabaseAuthService.loginWithEmail(email: email, password: password);

    final UserDataModel? userData = await _userDataRepo.getUserData();
    await saveUserDataLocal(userDataModel: userData!);

    return userData;
  }

  Future<UserDataModel> loginWithGoogle() async {
    final AuthResponse? authResponse = await _supabaseAuthService
        .loginWithGoogle();

    if (authResponse == null) {
      throw Exception('Google login failed');
    }

    final bool isExists = await _userDataRepo.isUserExists();

    final UserDataModel? userData = isExists
        ? await _userDataRepo.getUserData()
        : await _createGoogleUser(authResponse);

    await saveUserDataLocal(userDataModel: userData!);

    return userData;
  }

  Future<UserDataModel> _createGoogleUser(AuthResponse authResponse) {
    return _userDataRepo.updateUserData(
      userDataModel: UserDataModel(
        userId: authResponse.user!.id,
        name: authResponse.user!.userMetadata?['full_name'] ?? '',
        email: authResponse.user!.email ?? '',
        picture: authResponse.user!.userMetadata?['picture'] ?? '',
      ),
    );
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final AuthResponse authResponse = await _supabaseAuthService.register(
      email: email,
      password: password,
    );

    final UserDataModel userData = await _userDataRepo.updateUserData(
      userDataModel: UserDataModel(
        userId: authResponse.user!.id,
        name: name,
        email: authResponse.user!.email,
      ),
    );
    await saveUserDataLocal(userDataModel: userData);
  }

  Future<void> forgotPassword({required String email}) async {
    await _supabaseAuthService.forgotPassword(email: email);
  }
}
