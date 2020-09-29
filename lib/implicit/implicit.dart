import 'dart:math' as math;

import 'package:flutter/material.dart';

class ImplicitAnimations extends StatefulWidget {
  static const String route = 'implicitAnimations';

  static Route go() {
    return MaterialPageRoute<void>(builder: (_) => ImplicitAnimations());
  }

  @override
  _ImplicitAnimationsState createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations> {
  static const duration = Duration(seconds: 1);

  var _width = 50.0;
  var _height = 50.0;
  var _color = Colors.yellow;
  var _borderRadius = BorderRadius.circular(10.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(ImplicitAnimations.route)),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _AnimatedTitle(duration: duration),
              AnimatedContainer(
                width: _width,
                height: _height,
                curve: Curves.decelerate,
                duration: const Duration(seconds: 1),
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: _borderRadius,
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: _changeProps,
      ),
    );
  }

  void _changeProps() {
    final random = math.Random();

    _width = random.nextInt(300).toDouble();
    _height = random.nextInt(300).toDouble();
    _color = Colors.primaries[random.nextInt(10)];
    _borderRadius = BorderRadius.circular(random.nextDouble() % 100);

    setState(() {});
  }
}

class _AnimatedTitle extends StatelessWidget {
  const _AnimatedTitle({Key key, @required this.duration}) : super(key: key);

  final Duration duration;

  static final animation = Tween<double>(begin: 0.0, end: 1.0);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: animation,
      duration: duration,
      builder: (context, animation, child) {
        return Opacity(
          opacity: animation,
          child: Padding(
            padding: EdgeInsets.all(animation * 20),
            child: Text(
              'I\'m the title',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: animation * 25),
            ),
          ),
        );
      },
    );
  }
}
