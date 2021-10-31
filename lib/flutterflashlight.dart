import 'package:flutter/services.dart';

class FlutterFlashlight {
  static const MethodChannel _channel =
      const MethodChannel('flutterflashlight');

  static Future<bool> get hasFlashlight async {
    final bool _hasFlashlight = await _channel.invokeMethod('hasFlashlight');
    return _hasFlashlight;
  }

  static Future<void> flashlightOn() async {
    await _channel.invokeMethod('flashlightOn');
    return;
  }

  static Future<void> flashlightOff() async {
    await _channel.invokeMethod('flashlightOff');
    return;
  }
}
