import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/auth/data/repos/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SupabaseClient _supabase = Supabase.instance.client;
  final AuthRepo authRepo;
  AuthCubit({required this.authRepo}) : super(AuthInitial());

  // Login
  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());

    final Either<String, String> response = await authRepo.login(
      email: email,
      password: password,
    );
    return response.fold(
      (failure) => emit(AuthFailure(message: failure)),
      (userId) => emit(AuthSuccess(userId: userId)),
    );
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
      emit(AuthFailure(message: e.toString()));
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
      emit(AuthFailure(message: e.toString()));
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
