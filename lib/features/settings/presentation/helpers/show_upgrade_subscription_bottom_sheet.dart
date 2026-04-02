import 'package:flutter/material.dart';

import '../widgets/upgrade_subscription/upgrade_subscription_bottom_sheet.dart';

void showUpgradeSubscriptionBottomSheet({required BuildContext context}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => const UpgradeSubscriptionBottomSheet(),
  );
}
