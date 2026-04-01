import 'dart:convert';

import 'package:moodly/features/payment/data/models/subscription_model.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/services/cache_helper.dart';

class SubscriptionLocalService {
  Future<void> cacheSubscription({
    required SubscriptionModel subscriptionModel,
  }) async {
    final String jsonString = jsonEncode(subscriptionModel.toJson());
    await CacheHelper.set(key: kSubscriptionModel, value: jsonString);
  }

  SubscriptionModel? getSubscription() {
    final jsonString = CacheHelper.getString(key: kSubscriptionModel);

    if (jsonString == null) return null;

    final jsonMap = jsonDecode(jsonString);
    return SubscriptionModel.fromJson(jsonMap);
  }

  Future<void> markInactive() async {
    final current = getSubscription();
    if (current == null) return;

    final updated = SubscriptionModel(
      userId: current.userId,
      type: current.type,
      startDate: current.startDate,
      endDate: current.endDate,
      status: 'inactive',
    );

    await cacheSubscription(subscriptionModel: updated);
  }

  Future<void> clear() async {
    await CacheHelper.delete(key: kSubscriptionModel);
  }
}
