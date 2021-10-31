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
  bool _hasFlashlight = false;

  @override
  initState() {
    super.initState();
    initFlashlight();
  }

  initFlashlight() async {
    bool hasFlash = await FlutterFlashlight.hasFlashlight;
    print("Device has a flashlight ? $hasFlash");
    setState(() {
      _hasFlashlight = hasFlash;
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
                Text(_hasFlashlight
                    ? 'Your phone has a Flashlight.'
                    : 'Your phone has no Flashlight.'),
                ElevatedButton(
                  child: Text('Turn on'),
                  onPressed: () => FlutterFlashlight.lightOn(),
                ),
                ElevatedButton(
                  child: Text('Turn off'),
                  onPressed: () => FlutterFlashlight.lightOff(),
                )
              ],
            )),
      ),
    );
  }
}
