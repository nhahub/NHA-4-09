import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/horizontal_padding_list.dart';
import '../../../data/models/dummy/dummy_therapists.dart';
import '../../manager/therapist_cubit/therapist_cubit.dart';
import 'sessions_for_you_card.dart';

class SessionsForYouListView extends StatelessWidget {
  const SessionsForYouListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TherapistCubit, TherapistState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (GetTherapistsLoadingState):
            return HorizontalPaddingList(
              height: 382,
              isLoading: state is GetTherapistsLoadingState,
              itemCount: DummyTherapists.dummyTherapists.length,
              itemBuilder: (context, index) {
                return SessionsForYouCard(
                  therapistModel: DummyTherapists.dummyTherapists[index],
                );
              },
            );
          case const (GetTherapistsLoadedState):
            final loadedState = state as GetTherapistsLoadedState;
            return HorizontalPaddingList(
              height: 382,
              itemCount: loadedState.therapists.length,
              itemBuilder: (context, index) {
                return SessionsForYouCard(
                  therapistModel: loadedState.therapists[index],
                );
              },
            );
          case const (GetTherapistFailureState):
            final errorState = state as GetTherapistFailureState;
            return SizedBox(
              height: 382,
              child: Center(
                child: Text(
                  errorState.errorMsg,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
