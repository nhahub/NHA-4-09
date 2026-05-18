import 'dart:async';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<bool> get connectivityStream;
}

class NetworkMonitor implements NetworkInfo {
  final InternetConnection _checker = InternetConnection();

  @override
  Future<bool> get isConnected async {
    return await _checker.hasInternetAccess;
  }

  @override
  Stream<bool> get connectivityStream {
    return _checker.onStatusChange.map(
      (status) => status == InternetStatus.connected,
    );
  }
}
