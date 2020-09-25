import 'package:flutter/material.dart';

import 'explicit/explicit.dart';
import 'implicit/implicit.dart';
import 'packages/package.dart';

class AnimationsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Animations App',
      home: _Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _Home extends StatelessWidget {
  const _Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              title: const Text('Implicit'),
              onTap: () => Navigator.of(context).push(ImplicitAnimations.go()),
            ),
            ListTile(
              title: const Text('Explicit'),
              onTap: () => Navigator.of(context).push(ExplicitAnimations.go()),
            ),
            ListTile(
              title: const Text('Packages'),
              onTap: () => Navigator.of(context).push(PackageAnimations.go()),
            ),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(onPressed: null),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
