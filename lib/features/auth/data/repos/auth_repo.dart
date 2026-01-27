import 'package:dartz/dartz.dart';
import 'package:moodly/core/networking/supabase_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepo {
  final SupabaseService supabaseService;

  AuthRepo({required this.supabaseService});

  Future<Either<String, String>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseService.login(
        email: email,
        password: password,
      );
      return Right(response.user!.id);
    } on AuthApiException catch (e) {
      return Left(e.message);
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> register({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseService.register(
        email: email,
        password: password,
      );
      if (response.user != null) {
        await supabaseService.logout();
      }
      return Right(response.user!.id);
    } on AuthApiException catch (e) {
      return Left(e.message);
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, Unit>> forgotPassword({required String email}) async {
    try {
      await supabaseService.forgotPassword(email: email);
      return const Right(unit);
    } on AuthApiException catch (e) {
      return Left(e.message);
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, Unit>> logout() async {
    try {
      await supabaseService.logout();
      return const Right(unit);
    } on AuthApiException catch (e) {
      return Left(e.message);
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, Unit>> resetPassword({
    required String newPassword,
  }) async {
    try {
      await supabaseService.resetPassword(newPassword: newPassword);
      await supabaseService.logout();
      return const Right(unit);
    } on AuthApiException catch (e) {
      return Left(e.message);
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }
}
