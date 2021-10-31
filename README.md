# Flutter Flashlight

## Inspire me
[Be a Patreon](https://www.patreon.com/join/_lutfor?)

 A flutter plugin for controlling the mobile flash light.

## Installation

```

flutter pub add flutterflashlight 

```

or


```
dependencies:
  flutterflashlight: ^1.0.0

```

## Usage

```

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


```

## Contributions

Any kind of contribution will be appreciated.
 
[version_badge]: https://img.shields.io/pub/v/flutterflashlight.svg


## License
[MIT License](https://github.com/contactlutforrahman/flutterflashlight/blob/master/LICENSE)

