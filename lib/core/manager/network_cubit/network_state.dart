part of 'network_cubit.dart';

enum NetworkStatus { connected, disconnected, unknown }

extension NetworkStatusX on NetworkStatus {
  bool get isDisconnected => this == NetworkStatus.disconnected;
  bool get isConnected => this == NetworkStatus.connected;
}

class NetworkState extends Equatable {
  final bool isConnected;
  final NetworkStatus status;

  const NetworkState({
    required this.isConnected,
    this.status = NetworkStatus.unknown,
  });

  @override
  List<Object> get props => [isConnected, status];

  NetworkState copyWith({bool? isConnected, NetworkStatus? status}) {
    return NetworkState(
      isConnected: isConnected ?? this.isConnected,
      status: status ?? this.status,
    );
  }
}
