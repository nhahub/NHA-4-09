import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_error_widget.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';
import '../../data/models/dummy/dummy_legal_data.dart';
import '../../data/models/legal_data_model.dart';
import '../manager/privacy_policy_cubit/privacy_policy_cubit.dart';
import '../widgets/shared/legal_list_view.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BackButtonAppbar(title: "Privacy Policy"),
      body: BlocBuilder<PrivacyPolicyCubit, PrivacyPolicyState>(
        builder: (context, state) {
          switch (state) {
            case PrivacyPolicyLoadingState():
              return LegalListView(
                data: DummyLegalData.dummyPrivacyPolicy,
                isLoading: true,
              );

            case PrivacyPolicyLoadedState(:final List<LegalDataModel> data):
              return LegalListView(data: data);

            case PrivacyPolicyFailureState(:final String message):
              return CustomErrorWidget(message: message);
          }
        },
      ),
    );
  }
}
