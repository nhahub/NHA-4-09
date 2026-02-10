import '../../../../core/constants/constants.dart';
import '../../../../core/services/cache_helper.dart';

class OnboardingLocalService {
  Future<void> setSeenOnboarding() async {
    await CacheHelper.set(key: kHasSeenOnboarding, value: true);
  }

  static bool hasSeenOnboarding() {
    return CacheHelper.getBool(key: kHasSeenOnboarding);
  }
}
