import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_constants.dart';

class DioFactory {
  late final Dio dio;

  DioFactory() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.stripeBaseUrl,
        connectTimeout: const Duration(minutes: 1),
        receiveTimeout: const Duration(minutes: 1),
        sendTimeout: const Duration(minutes: 5),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args) {
          if (options.path.contains('/products')) {
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        },
      ),
    );
  }
}

//   Future<bool> _refreshAccessToken() async {
//     final refreshToken = await CacheHelper.getSecureData(key: kRefreshToken);
//     if (refreshToken == null) return false;
//     try {
//       final Response response = await Dio().post(
//         ApiConstants.apiBaseUrl + ApiConstants.refreshToken,
//         data: RefreshTokenRequestBody(refreshToken: refreshToken).toJson(),
//       );
//       final newAccessToken = response.data["accessToken"];
//       final newRefreshToken = response.data["refreshToken"];
//       await CacheHelper.setSecureData(key: kAccessToken, value: newAccessToken);
//       await CacheHelper.setSecureData(
//         key: kRefreshToken,
//         value: newRefreshToken,
//       );
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
// }
