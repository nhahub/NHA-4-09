import '../errors/failure.dart';

class ApiErrorModel extends Failure {
  ApiErrorModel({required super.message});

  factory ApiErrorModel.fromJson({required Map<String, dynamic> json}) {
    return ApiErrorModel(
      message: json['message'] ?? 'An unexpected error occurred',
    );
  }
}
