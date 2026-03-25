import 'package:flutter/material.dart';
import 'package:moodly/features/home/presentation/widgets/shared/back_button_appbar.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BackButtonAppbar(title: "Terms and Conditions"),
      body: Center(child: Text("Terms and Conditions content goes here.")),
    );
  }
}
