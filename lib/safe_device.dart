import 'dart:async';

import 'package:flutter/services.dart';

class SafeDevice {
  static const MethodChannel _channel = const MethodChannel('s');

  static Future<bool> get isJailBroken async {
    final bool isJailBroken = await _channel.invokeMethod('n');
    return isJailBroken;
  }

  static Future<bool> get isRealDevice async {
    final bool isRealDevice = await _channel.invokeMethod('r');
    return isRealDevice;
  }

  static Future<bool> get isSafeDevice async {
    final bool isJailBroken = await _channel.invokeMethod('n');
    final bool isRealDevice = await _channel.invokeMethod('r');
    return !isJailBroken && isRealDevice;
  }
}
