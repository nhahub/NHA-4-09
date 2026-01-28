import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final SupabaseClient _supabase = Supabase.instance.client;
  // Login
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    final AuthResponse response = await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return response;
  }

  // Register
  Future<AuthResponse> register({
    required String email,
    required String password,
  }) async {
    final response = await _supabase.auth.signUp(
      email: email,
      password: password,
    );
    return response;
  }

  // Forgot Password
  Future<void> forgotPassword({required String email}) async {
    // await _supabase.auth.resetPasswordForEmail(
    //   email,
    //   redirectTo: 'moodly://reset-password',
    // );
  }

  // Logout
  Future<void> logout() async {
    await _supabase.auth.signOut();
  }

  // Reset Password
  Future<void> resetPassword({required String newPassword}) async {
    await _supabase.auth.updateUser(UserAttributes(password: newPassword));
  }

  Future<String> getAccessToken() async {
    final User? currentUser = _supabase.auth.currentUser;
    return currentUser!.id;
  }
}
