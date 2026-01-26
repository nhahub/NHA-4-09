import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part  'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SupabaseClient _supabase = Supabase.instance.client;
  AuthCubit() : super(AuthInitial());

  // تسجيل الدخول
  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final AuthResponse response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user != null) {
        emit(AuthSuccess(response.user!.id));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  // إنشاء حساب جديد (تم التعديل)
  Future<void> register(String email, String password) async {
    emit(AuthLoading());
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );
      if (response.user != null) {
        await _supabase.auth.signOut();
        await Future.delayed(const Duration(milliseconds: 300));
        emit(RegisterSuccess());
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> forgotPassword(String email) async {
    emit(AuthLoading());
    try {
      await _supabase.auth.resetPasswordForEmail(
        email,
        redirectTo: 'moodly://reset-password',
      );

      emit(ForgotPasswordSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> logout() async {
    try {
      await _supabase.auth.signOut();
      emit(AuthInitial());
    } catch (e) {
      log("Error logging out: $e");
    }
  }
}
