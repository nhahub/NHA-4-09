import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'authatcation_state.dart';

class AuthatcationCubit extends Cubit<AuthatcationState> {
  final SupabaseClient _supabase = Supabase.instance.client;
  AuthatcationCubit() : super(AuthInitial());

  // تسجيل الدخول
  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final response = await _supabase.auth.signInWithPassword(
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
        // نخرج فوراً حتى لا يتعرف الراوتر على وجود جلسة
        await _supabase.auth.signOut();
        await Future.delayed(const Duration(milliseconds: 300));
        emit(RegisterSuccess());
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> logout() async {
    try {
      await _supabase.auth.signOut();
      emit(AuthInitial());
    } catch (e) {
      log("خطأ في تسجيل الخروج: $e");
    }
  }
}
