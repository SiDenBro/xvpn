import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xvpn/core/enums/connection.dart';

final connectioNotifierProvider = NotifierProvider<ConnectionNotifier, ConnectionState>(
  ConnectionNotifier.new,
);

class ConnectionState {
  final ConnectionStatus connectionStatus;

  ConnectionState({
    required this.connectionStatus,
  });

  ConnectionState.disconnected()
      : connectionStatus = ConnectionStatus.disconnected;

  ConnectionState.connecting() : connectionStatus = ConnectionStatus.connecting;

  ConnectionState.connected() : connectionStatus = ConnectionStatus.connected;
}

class ConnectionNotifier extends Notifier<ConnectionState> {
  @override
  ConnectionState build() {
    return ConnectionState.disconnected();
  }

  Future<void> connect() async {
    state = ConnectionState.connecting();
    await Future.delayed(const Duration(seconds: 2));
    state = ConnectionState.connected();
  }

  Future<void> disconnect() async {
    state = ConnectionState.connecting();
    await Future.delayed(const Duration(seconds: 2));
    state = ConnectionState.disconnected();
  }
}
