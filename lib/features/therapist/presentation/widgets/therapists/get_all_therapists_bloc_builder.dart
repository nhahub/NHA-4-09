import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/constants.dart';
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
          switch (state) {
            case GetTherapistsLoadingState():
              return GetAllTherapistsSliverList(
                isLoading: true,
                therapists: DummyTherapists.dummyTherapists,
              );

            case GetTherapistsLoadedState(
              :final List<TherapistModel> therapists,
            ):
              return GetAllTherapistsSliverList(therapists: therapists);

            case GetTherapistFailureState(:final String errorMsg):
              return SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    errorMsg,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
