import 'package:flutter/services.dart';

class FlutterFlashlight {
  static const MethodChannel _channel =
      const MethodChannel('flutterflashlight');

  static Future<bool> get hasFlashlight async {
    final bool _hasFlashlight = await _channel.invokeMethod('hasFlashlight');
    return _hasFlashlight;
  }

  static Future<void> lightOn() async {
    await _channel.invokeMethod('lightOn');
    return;
  }

  static Future<void> lightOff() async {
    await _channel.invokeMethod('lightOff');
    return;
  }
}
