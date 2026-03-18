import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../home/data/repos/water_repo.dart';
import '../../../home/presentation/manager/cups_of_water_cubit/water_tracking_cubit.dart';
import '../../../home/presentation/views/home_view.dart';
import '../../../therapist/data/repos/therapist_repo.dart';
import '../../../therapist/presentation/manager/therapist_cubit/therapist_cubit.dart';

class HomeProvidersWrapper extends StatelessWidget {
  final bool isPremium;

  const HomeProvidersWrapper({super.key, required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              WaterTrackingCubit(waterRepo: getIt.get<WaterRepo>())..loadData(),
        ),
        BlocProvider(
          create: (_) =>
              TherapistCubit(therapistRepo: getIt.get<TherapistRepo>())
                ..getTherapists(),
        ),
      ],
      child: HomeView(key: const ValueKey('home'), isPremium: isPremium),
    );
  }
}
