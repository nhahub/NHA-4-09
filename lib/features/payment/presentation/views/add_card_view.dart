import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_styles.dart';
import '../widgets/add_card/add_card_view_body.dart';

class AddCardView extends StatelessWidget {
  const AddCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            AppAssets.arrowLeftIosIcon,
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Add New Card",
          style: AppStyles.extraBold20.copyWith(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: const AddCardViewBody(),
    );
  }
}
