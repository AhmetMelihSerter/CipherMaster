import 'package:flutter/services.dart';
import 'package:connectivity/connectivity.dart';

class NetworkManager {
  static NetworkManager _instance = NetworkManager._internal();

  static NetworkManager get instance => _instance;

  NetworkManager._internal();

  /// Internet connection is checked.
  /// return bool if network connection successful.
  /// return true if network == mobile.
  /// return false if network == wifi.
  /// return [PlatformException(code: 'no_network_connection')] if no network connection.
  Future<bool> connectCheck() async {
    var result = await (Connectivity().checkConnectivity());
    if (result == ConnectivityResult.wifi) {
      return false;
    } else if (result == ConnectivityResult.mobile) {
      return true;
    } else {
      throw PlatformException(code: 'no_network_connection');
    }
  }
}
