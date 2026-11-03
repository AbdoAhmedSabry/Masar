import 'dart:async';

import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

/// بيراقب الاتصال بالإنترنت الفعلي (مش بس وجود WiFi)
class ConnectivityService extends GetxService {
  final isConnected = true.obs;

  final InternetConnection _checker = InternetConnection();
  StreamSubscription<InternetStatus>? _sub;

  Future<ConnectivityService> init() async {
    isConnected.value = await _checker.hasInternetAccess;
    _sub = _checker.onStatusChange.listen((status) {
      final connected = status == InternetStatus.connected;
      if (isConnected.value != connected) {
        isConnected.value = connected;
      }
    });
    return this;
  }

  /// تحقق لحظي قبل أي عملية شبكة
  Future<bool> check() async {
    final result = await _checker.hasInternetAccess;
    isConnected.value = result;
    return result;
  }

  @override
  void onClose() {
    _sub?.cancel();
    super.onClose();
  }
}
