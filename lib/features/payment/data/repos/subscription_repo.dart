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

  Future<Either<Failure, void>> createSubscription({
    required String type,
  }) async {
    try {
      final SubscriptionModel subscriptionModel = await subscriptionService
          .createSubscription(type: type);

      await cacheSubscription(
        status: subscriptionModel.status,
        endDate: subscriptionModel.endDate,
      );

      return right(null);
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
        await cacheSubscription(
          status: subscription.status,
          endDate: subscription.endDate,
        );
      }

      return right(subscription);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<void> cacheSubscription({
    required String status,
    required DateTime endDate,
  }) async {
    await CacheHelper.set(key: kSubscriptionStatus, value: status);
    await CacheHelper.set(
      key: kSubscriptionEndDate,
      value: endDate.toIso8601String(),
    );
  }

  bool isSubscriptionActive() {
    final status = CacheHelper.getString(key: kSubscriptionStatus);
    final endDateString = CacheHelper.getString(key: kSubscriptionEndDate);

    if (status != 'active' || endDateString == null) return false;

    final endDate = DateTime.parse(endDateString);

    return DateTime.now().isBefore(endDate);
  }
}
