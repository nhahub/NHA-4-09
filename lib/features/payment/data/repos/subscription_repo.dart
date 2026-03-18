import 'package:dartz/dartz.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/services/cache_helper.dart';
import '../models/subscription_model.dart';
import '../services/subscription_service.dart';

class SubscriptionRepo {
  final SubscriptionService subscriptionService;

  SubscriptionRepo({required this.subscriptionService});

  Future<Either<Failure, String>> createSubscription({
    required String type,
    required String transactionId,
  }) async {
    try {
      final String status = await subscriptionService.createSubscription(
        type: type,
        transactionId: transactionId,
      );

      await addCachedStatus(status: status);

      return right(status);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, SubscriptionModel?>>
  getUserActiveSubscription() async {
    try {
      final subscription = await subscriptionService
          .getUserActiveSubscription();

      if (subscription != null) {
        await addCachedStatus(status: subscription.status);
      }

      return right(subscription);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  String? getCachedStatus() {
    return CacheHelper.getString(key: kSubscriptionStatus);
  }

  Future<void> addCachedStatus({required String status}) {
    CacheHelper.set(key: kSubscriptionStatus, value: status);
    return Future.value();
  }
}
