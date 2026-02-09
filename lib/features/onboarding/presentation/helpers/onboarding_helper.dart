import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/core/routing/routes.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/services/cache_helper.dart';

void onFinishOnboarding(BuildContext context) async {
  await CacheHelper.set(key: kHasSeenOnboarding, value: true);
  if (context.mounted) {
    context.pushAndRemoveUntil(Routes.premiumView);
  }
}

bool checkIfHasSeenOnboarding() {
  final bool hasSeenOnboarding = CacheHelper.getBool(key: kHasSeenOnboarding);
  return hasSeenOnboarding;
}
