import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/helpers/logger.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    Logger.log('Cubit: ${bloc.runtimeType}');
    Logger.log('Current: ${change.currentState}');
    Logger.log('Next: ${change.nextState}');
  }
}
