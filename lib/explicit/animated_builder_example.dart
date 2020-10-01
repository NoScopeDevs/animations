import 'package:flutter/material.dart';

class AnimatedBuilderExample extends StatefulWidget {
  static Route go() {
    return MaterialPageRoute<void>(builder: (_) => AnimatedBuilderExample());
  }

  @override
  _AnimatedBuilderExampleState createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    super.initState();

    _animationController.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      },
    );

    // ignore: cascade_invocations
    _animationController.forward();

    //* Easier
    // _animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedBuilder'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.scale(
              scale: _animationController.value * 10,
              child: Container(
                width: 20,
                height: 20,
                color: Colors.green,
              ),
            );
          },
        ),
      ),
    );
  }
}
