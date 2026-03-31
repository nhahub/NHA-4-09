import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/app_text_form_field.dart';
import '../../manager/app_rating_cubit/app_rating_cubit.dart';

class FeedbackTextField extends StatelessWidget {
  final TextEditingController controller;

  const FeedbackTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppRatingCubit, AppRatingState>(
      listenWhen: (prev, curr) => curr is GetAppRatingSuccessState,
      listener: (context, state) {
        if (state is GetAppRatingSuccessState) {
          controller.text = state.appRatingModel?.feedback ?? '';
        }
      },
      child: AppTextFormField(
        hintText: "Write your feedback...",
        maxLines: 4,
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter your feedback";
          }
          return null;
        },
      ),
    );
  }
}
