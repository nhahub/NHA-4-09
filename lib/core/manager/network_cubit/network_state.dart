part of 'network_cubit.dart';

enum NetworkStatus { unknown, connected, disconnected, reconnected }

extension NetworkStatusX on NetworkStatus {
  bool get isUnknown => this == NetworkStatus.unknown;
  bool get isDisconnected => this == NetworkStatus.disconnected;
  bool get isConnected => this == NetworkStatus.connected;
  bool get isReconnected => this == NetworkStatus.reconnected;
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
