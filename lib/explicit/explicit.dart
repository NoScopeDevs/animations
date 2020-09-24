import 'package:flutter/material.dart';

class ExplicitAnimations extends StatelessWidget {
  static const String route = 'explicitAnimations';

  static Route go() {
    return MaterialPageRoute<void>(builder: (_) => ExplicitAnimations());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('This is ExplicitAnimations'),
      ),
    );
  }
}
