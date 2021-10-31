import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterflashlight/flutterflashlight.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutterflashlight');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return true;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('chekIfHasFlashlight', () async {
    expect(await FlutterFlashlight.hasFlashlight, true);
  });
}
