import 'package:flutter/material.dart';

import '../../../home/presentation/widgets/shared/back_button_appbar.dart';

class SubscriptionManagementView extends StatelessWidget {
  const SubscriptionManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BackButtonAppbar(title: "Subscription Management"),
      body: Center(child: Text("Subscription Management content goes here.")),
    );
  }
}
