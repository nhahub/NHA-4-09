import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_styles.dart';
import '../manager/payment_cubit/payment_cubit.dart';
import '../widgets/subscribe/subscribe_view_body.dart';

class SubscribeView extends StatelessWidget {
  const SubscribeView({super.key, this.price = 100.0});
  final double price;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xffF9F9F9),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: SvgPicture.asset(
              AppAssets.arrowLeftIosIcon,
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcIn,
              ),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text("Payment", style: AppStyles.extraBold20),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.qr_code_scanner, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: SubscribeViewBody(price: price),
      ),
    );
  }
}
