import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../networking/network_info.dart';
part 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  final NetworkMonitor _networkMonitor;
  StreamSubscription<bool>? _subscription;

  NetworkCubit({required NetworkMonitor networkMonitor})
    : _networkMonitor = networkMonitor,
      super(
        const NetworkState(isConnected: false, status: NetworkStatus.unknown),
      );

  Future<void> init() async {
    final bool initial = await _networkMonitor.isConnected;
    emit(
      state.copyWith(
        isConnected: initial,
        status: initial ? NetworkStatus.connected : NetworkStatus.disconnected,
      ),
    );

    _subscription = _networkMonitor.connectivityStream.listen((connected) {
      if (connected == state.isConnected) return;

      emit(
        state.copyWith(
          isConnected: connected,
          status: connected
              ? NetworkStatus.connected
              : NetworkStatus.disconnected,
        ),
      );
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
