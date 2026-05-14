import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/horizontal_padding_list.dart';
import '../../../../therapist/data/models/dummy/dummy_therapists.dart';
import '../../../../therapist/data/models/therapist_model.dart';
import '../../../../therapist/presentation/manager/therapist_cubit/therapist_cubit.dart';
import 'sessions_for_you_card.dart';

class SessionsForYouListView extends StatelessWidget {
  const SessionsForYouListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TherapistCubit, TherapistState>(
      builder: (context, state) {
        switch (state.status) {
          case TherapistStatus.loading:
            return HorizontalPaddingList(
              height: 382,
              isLoading: true,
              itemCount: DummyTherapists.dummyTherapists.length,
              itemBuilder: (context, index) {
                return SessionsForYouCard(
                  therapistModel: DummyTherapists.dummyTherapists[index],
                );
              },
            );

          case TherapistStatus.success:
            final List<TherapistModel> therapists = state.therapists ?? [];
            return HorizontalPaddingList(
              height: 382,
              itemCount: therapists.length,
              itemBuilder: (context, index) {
                return SessionsForYouCard(therapistModel: therapists[index]);
              },
            );

          case TherapistStatus.failure:
            final message = state.error ?? 'Something went wrong';
            return CustomErrorWidget(message: message);
        }
      },
    );
  }
}
