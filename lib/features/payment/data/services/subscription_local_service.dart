import '../../../../core/constants/constants.dart';
import '../../../../core/services/cache_helper.dart';

class SubscriptionLocalService {
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

  String? getStatus() {
    return CacheHelper.getString(key: kSubscriptionStatus);
  }

  DateTime? getEndDate() {
    final date = CacheHelper.getString(key: kSubscriptionEndDate);
    if (date == null) return null;
    return DateTime.parse(date);
  }

  Future<void> markInactive() async {
    await CacheHelper.set(key: kSubscriptionStatus, value: 'inactive');
  }

  Future<void> clear() async {
    await CacheHelper.delete(key: kSubscriptionStatus);
    await CacheHelper.delete(key: kSubscriptionEndDate);
  }
}
