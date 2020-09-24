import 'package:flutter/material.dart';

class ImplicitAnimations extends StatelessWidget {
  static const String route = 'implicitAnimations';

  static Route go() {
    return MaterialPageRoute<void>(builder: (_) => ImplicitAnimations());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('This is ImplicitAnimations'),
      ),
    );
  }
}
