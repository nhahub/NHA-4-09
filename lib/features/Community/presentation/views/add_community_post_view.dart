import 'package:flutter/material.dart';

import '../../../home/presentation/widgets/shared/back_button_appbar.dart';

class AddCommunityPostView extends StatelessWidget {
  const AddCommunityPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BackButtonAppbar(title: "Add Post"),
      body: Column(children: [Center(child: Text("Add Post"))]),
    );
  }
}
