import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/app_rating_cubit/app_rating_cubit.dart';

void submitFeedback(BuildContext context, String feedback) {
  context.read<AppRatingCubit>().validateAndSubmit(feedback: feedback);
}
