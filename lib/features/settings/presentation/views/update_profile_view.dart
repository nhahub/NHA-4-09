import 'package:flutter/material.dart';
import 'package:moodly/features/settings/presentation/widgets/update_profile/update_profile_form.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BackButtonAppbar(title: "Update Profile"),
      body: UpdateProfileForm(),
    );
  }
}
