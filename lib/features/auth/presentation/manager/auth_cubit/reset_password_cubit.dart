import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final SupabaseClient _supabase = Supabase.instance.client;

  ResetPasswordCubit() : super(ResetPasswordInitial());

  Future<void> resetPassword(String newPassword) async {
    emit(ResetPasswordLoading());

    try {
      await _supabase.auth.updateUser(UserAttributes(password: newPassword));

      await _supabase.auth.signOut();

      emit(ResetPasswordSuccess());
    } catch (e) {
      emit(ResetPasswordFailure(e.toString()));
    }
  }
}
