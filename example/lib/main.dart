import 'package:flutter/material.dart';
import 'package:safe_device/safe_device.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isJailBroken = false;
  bool isRealDevice = true;
  bool isSafeDevice = false;
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    if (!mounted) return;
    try {
      isJailBroken = await SafeDevice.isJailBroken;
      isRealDevice = await SafeDevice.isRealDevice;
      isSafeDevice = await SafeDevice.isSafeDevice;
    } catch (error) {
      print(error);
    }

    setState(() {
      isJailBroken = isJailBroken;
      isRealDevice = isRealDevice;
      isSafeDevice = isSafeDevice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Device Safe check'),
        ),
        body: Center(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('isJailBroken():'),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '${isJailBroken ? "Yes" : "No"}',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('isRealDevice():'),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '${isRealDevice ? "Yes" : "No"}',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('isSafeDevice():'),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '${isSafeDevice ? "Yes" : "False"}',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
