import 'package:flutter/material.dart';
import 'asmr_bloc_builder.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/widgets/app_section_header.dart';

class AsmrSection extends StatelessWidget {
  const AsmrSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSectionHeader(title: "ASMR Audios"),
        SizedBox(height: kAppSectionSpacing),
        AsmrBlocBuilder(),
      ],
    );
  }
}
