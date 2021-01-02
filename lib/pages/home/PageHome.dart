import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PageHome extends StatefulWidget {
  @override
  PageHomeState createState() => PageHomeState();
}

class PageHomeState extends State<PageHome> {
  static const platform = const MethodChannel('samples.flutter.dev/test');
  String _res = '初始值';

  Future<void> _callNativefun() async {
    String res;
    try {
      final String result =
          await platform.invokeMethod('testFun', ['aaa', '234', 'sds']);

      res = '$result';
    } on PlatformException catch (e) {
      res = "Failed: '${e.message}'.";
    }

    setState(() {
      _res = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text('call native fun test(ios)'),
              onPressed: _callNativefun,
            ),
            Text(_res),
          ],
        ),
      ),
    );
  }
}
