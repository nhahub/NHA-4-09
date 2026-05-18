import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/constants/constants.dart';
import '../../helpers/subscribe_mapper.dart';
import '../../manager/payment_cubit/payment_cubit.dart';
import '../../manager/payment_cubit/payment_state.dart';
import 'payment_methods_section.dart';

class SubscribeContent extends StatelessWidget {
  final PaymentState state;

  const SubscribeContent({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final data = SubscribeMapper.map(state);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
      child: PaymentMethodsSection(
        selectedMethodIndex: data.selectedMethodIndex,
        onMethodSelected: (index) =>
            context.read<PaymentCubit>().selectMethod(index),
      ),
    );
  }
}
