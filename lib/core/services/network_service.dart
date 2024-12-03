import 'dart:async';

import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

///
/// This class checks if device has internet connectivity or not
///
class NetworkService extends GetxService {
  RxBool isConnectedToInternet = false.obs;

  final InternetConnectionChecker _internetConnectionChecker =
      InternetConnectionChecker.createInstance();

  bool? _isInternetConnected;
  StreamSubscription? _internetConnectionSubscription;

  Future<NetworkService> init() async {
    _internetConnectionSubscription ??=
        _internetConnectionChecker.onStatusChange.listen(
      (InternetConnectionStatus status) {
        bool isInternet = false;
        switch (status) {
          case InternetConnectionStatus.connected:
            isInternet = true;
          case InternetConnectionStatus.disconnected:
            isInternet = false;
        }
        if (_isInternetConnected == null ||
            _isInternetConnected != isInternet) {
          _isInternetConnected = isInternet;
          isConnectedToInternet.value = isInternet;
        }
      },
    );
    return this;
  }

  Future<bool> isConnected() async {
    bool result = await _internetConnectionChecker.hasConnection;
    return result;
  }

  void dispose() {
    _internetConnectionSubscription?.cancel();
  }
}