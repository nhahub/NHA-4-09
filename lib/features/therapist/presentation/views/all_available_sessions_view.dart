import 'package:flutter/material.dart';
import '../widgets/therapists/get_all_therapists_bloc_builder.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';

class AllAvailableSessionsView extends StatelessWidget {
  const AllAvailableSessionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: BackButtonAppbar(title: "All Sessions")),
            GetAllTherapistsBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
