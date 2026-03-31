import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/get_it_service.dart';
import '../../data/repos/app_rating_repo.dart';
import '../widgets/feedback/feedback_bottom_sheet.dart';

import '../manager/app_rating_cubit/app_rating_cubit.dart';

void showFeedbackBottomSheet({required BuildContext context}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => BlocProvider(
      create: (context) =>
          AppRatingCubit(appRatingRepo: getIt.get<AppRatingRepo>())
            ..getUserRating(),
      child: const FeedbackBottomSheet(),
    ),
  );
}
