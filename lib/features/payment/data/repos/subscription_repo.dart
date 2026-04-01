import 'package:dartz/dartz.dart';
import 'package:moodly/core/helpers/logger.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../models/subscription_model.dart';
import '../services/subscription_local_service.dart';
import '../services/subscription_remote_service.dart';

class SubscriptionRepo {
  final SubscriptionLocalService local;
  final SubscriptionRemoteService remote;

  SubscriptionRepo({required this.local, required this.remote});

  Future<Either<Failure, bool>> checkSubscription() async {
    try {
      final localStatus = local.getSubscription()?.status;
      final localEndDate = local.getSubscription()?.endDate;

      if (localStatus != null && localEndDate != null) {
        final isActive = _isLocalActive(localStatus, localEndDate);

        if (!isActive) {
          await remote.deleteUserSubscription();
        }

        return right(isActive);
      }

      final SubscriptionModel? remoteSub = await remote.getUserSubscription();

      if (remoteSub != null) {
        await local.cacheSubscription(subscriptionModel: remoteSub);

        return right(_isLocalActive(remoteSub.status, remoteSub.endDate));
      }

      return right(false);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, void>> createSubscription({
    required String type,
  }) async {
    try {
      final SubscriptionModel sub = await remote.createUserSubscription(
        type: type,
      );

      await local.cacheSubscription(subscriptionModel: sub);

      return right(null);
    } catch (e) {
      Logger.log("Error creating subscription: $e");
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  bool _isLocalActive(String status, DateTime endDate) {
    if (DateTime.now().isAfter(endDate)) {
      local.markInactive();
      return false;
    }

    return status == 'active';
  }
}
