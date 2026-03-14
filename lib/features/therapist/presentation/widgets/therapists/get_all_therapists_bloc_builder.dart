import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/constants.dart';
import '../../../data/models/dummy/dummy_therapists.dart';
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
          switch (state.runtimeType) {
            case const (GetTherapistsLoadingState):
              return GetAllTherapistsSliverList(
                isLoading: state is GetTherapistsLoadingState,
                therapists: DummyTherapists.dummyTherapists,
              );
            case const (GetTherapistsLoadedState):
              final loadedState = state as GetTherapistsLoadedState;
              return GetAllTherapistsSliverList(
                therapists: loadedState.therapists,
              );
            case const (GetTherapistFailureState):
              final errorState = state as GetTherapistFailureState;
              return SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    errorState.errorMsg,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              );
            default:
              return const SliverToBoxAdapter();
          }
        },
      ),
    );
  }
}
