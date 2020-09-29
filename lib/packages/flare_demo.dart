import 'package:flutter/material.dart';

class FlareScreen extends StatelessWidget {
  static const String route = 'flare';

  static Route go() => MaterialPageRoute<void>(builder: (_) => FlareScreen());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('This is FlareScreen'),
      ),
    );
  }
}
