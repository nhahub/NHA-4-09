import 'package:flutter/material.dart';

import '../../../home/presentation/widgets/shared/back_button_appbar.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BackButtonAppbar(title: "Edit Profile"),
      body: Center(child: Text("Edit Profile content goes here.")),
    );
  }
}
