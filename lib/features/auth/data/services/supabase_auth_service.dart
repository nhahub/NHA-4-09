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

  Future<AuthResponse?> loginWithGoogle() async {
    // Initiate Google OAuth flow
    await _supabase.auth.signInWithOAuth(
      OAuthProvider.google,
      redirectTo: 'moodly://auth/callback',
      queryParams: const {'prompt': 'select_account'},
    );

    // Wait for auth state change
    final response = await _supabase.auth.onAuthStateChange
        .where(
          (state) =>
              state.event == AuthChangeEvent.signedIn ||
              state.event == AuthChangeEvent.userUpdated,
        )
        .timeout(
          const Duration(seconds: 30),
          onTimeout: (sink) {
            sink.close();
          },
        )
        .first;

    final session = response.session;

    if (session != null) {
      return AuthResponse(session: session, user: session.user);
    } else {
      return null;
    }
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
    await _supabase.auth.resetPasswordForEmail(
      email,
      redirectTo: 'moodly://reset-password',
    );
  }

  // Logout
  Future<void> logout() async {
    await _supabase.auth.signOut();
  }

  // Edit User Profile
  Future<UserResponse> updateUserProfile({
    String? email,
    String? phone,
    String? password,
    Map<String, dynamic>? data,
  }) async {
    UserResponse userResponse = await _supabase.auth.updateUser(
      UserAttributes(
        email: email,
        phone: phone,
        password: password,
        data: data,
      ),
    );
    return userResponse;
  }
}
