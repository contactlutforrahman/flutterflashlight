import 'package:flutter/material.dart';
import 'package:flutterflashlight/flutterflashlight.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _checkIfHasFlashlight = false;

  @override
  initState() {
    super.initState();
    initFlashlight();
  }

  initFlashlight() async {
    bool _ifHasFlashlight = await FlutterFlashlight.hasFlashlight;
    print("Device has a flashlight ? $_ifHasFlashlight");
    setState(() {
      _checkIfHasFlashlight = _ifHasFlashlight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flashlight Plugin for flutter'),
        ),
        body: Center(
            child: Column(
              children: <Widget>[
                Text(_checkIfHasFlashlight
                    ? 'Your phone has a Flashlight.'
                    : 'Your phone does not have a Flashlight.'),
                ElevatedButton(
                  child: Text('Turn on'),
                  onPressed: () => FlutterFlashlight.flashlightOn(),
                ),
                ElevatedButton(
                  child: Text('Turn off'),
                  onPressed: () => FlutterFlashlight.flashlightOff(),
                )
              ],
            )),
      ),
    );
  }
}
