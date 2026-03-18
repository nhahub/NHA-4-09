import 'package:flutter/material.dart';

import '../../../home/presentation/widgets/shared/back_button_appbar.dart';
import '../widgets/add_card/add_card_view_body.dart';

class AddCardView extends StatelessWidget {
  const AddCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: BackButtonAppbar(title: "Add New Card"),
      body: AddCardViewBody(),
    );
  }
}
