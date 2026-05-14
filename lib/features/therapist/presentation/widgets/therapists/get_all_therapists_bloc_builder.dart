import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../data/models/dummy/dummy_therapists.dart';
import '../../../data/models/therapist_model.dart';
import '../../manager/therapist_cubit/therapist_cubit.dart';
import 'get_all_therapists_sliver_list.dart';

class GetAllTherapistsBlocBuilder extends StatelessWidget {
  const GetAllTherapistsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        left: kAppHorizontalPadding,
        right: kAppHorizontalPadding,
        bottom: 44,
      ),
      sliver: BlocBuilder<TherapistCubit, TherapistState>(
        builder: (context, state) {
          switch (state.status) {
            case TherapistStatus.loading:
              return GetAllTherapistsSliverList(
                isLoading: true,
                therapists: DummyTherapists.dummyTherapists,
              );

            case TherapistStatus.success:
              final List<TherapistModel> therapists = state.therapists ?? [];
              return GetAllTherapistsSliverList(therapists: therapists);

            case TherapistStatus.failure:
              final message = state.error ?? 'Something went wrong';
              return SliverToBoxAdapter(
                child: CustomErrorWidget(message: message),
              );
          }
        },
      ),
    );
  }
}
