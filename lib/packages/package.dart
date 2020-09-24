import 'package:flutter/material.dart';

class PackageAnimations extends StatelessWidget {
  static const String route = 'packageAnimations';

  static Route go() {
    return MaterialPageRoute<void>(builder: (_) => PackageAnimations());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('This is PackageAnimations'),
      ),
    );
  }
}
