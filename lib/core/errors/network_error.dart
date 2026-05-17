import '../networking/api_error_model.dart';

class NetworkError {
  
  ApiErrorModel handle() {
    return ApiErrorModel(message: 'Please check your internet connection.');
  }
}
