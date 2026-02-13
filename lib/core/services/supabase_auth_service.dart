import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthService {
  final SupabaseClient _supabase = Supabase.instance.client;
  // Login
  Future<AuthResponse> loginWithEmail({
    required String email,
    required String password,
  }) async {
    final AuthResponse response = await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return response;
  }

  // Your Task (Ahmed)
  Future<AuthResponse> loginWithGoogle() async {
    // Initiate Google OAuth flow
    await _supabase.auth.signInWithOAuth(
      OAuthProvider.google,
      redirectTo: 'moodly://auth/callback',
      queryParams: const {
        // Force account chooser each time
        'prompt': 'select_account',
      },
    );

    // Wait for auth state change with timeout
    final response = await _supabase.auth.onAuthStateChange
        .where((state) =>
            state.event == AuthChangeEvent.signedIn ||
            state.event == AuthChangeEvent.userUpdated)
        .timeout(
          const Duration(seconds: 30),
          onTimeout: (sink) {
            throw Exception('Login timeout. Please try again.');
          },
        )
        .first;

    // Return the auth response
    return AuthResponse(
      session: response.session,
      user: response.session?.user,
    );
  }

  // Register
  Future<AuthResponse> register({
    required String email,
    required String password,
    required String name,
  }) async {
    final response = await _supabase.auth.signUp(
      email: email,
      password: password,
      data: {
        'name': name,
        "is_old_user": false,
        "image": "",
        "phone": "",
        "birth_date": "",
        "gender": "",
      },
    );
    return response;
  }

  // Forgot Password
  Future<void> forgotPassword({required String email}) async {
    await _supabase.auth.resetPasswordForEmail(
      email,
      redirectTo: 'moodly://reset-password',
    );
  }

  // Logout
  Future<void> logout() async {
    await _supabase.auth.signOut();
  }

  // Reset Password
  Future<void> resetPassword({required String newPassword}) async {
    await _supabase.auth.updateUser(UserAttributes(password: newPassword));
  }

  Future<void> editUserProfile({required Map<String, dynamic> data}) async {
    await _supabase.auth.updateUser(UserAttributes(data: data));
  }
}
