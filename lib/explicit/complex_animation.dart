import 'dart:math' as math;
import 'package:flutter/material.dart';

class ComplexAnimation extends StatefulWidget {
  static Route go() {
    return MaterialPageRoute<void>(builder: (_) => ComplexAnimation());
  }

  @override
  _ComplexAnimationState createState() => _ComplexAnimationState();
}

class _ComplexAnimationState extends State<ComplexAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animationPosition;
  Animation<double> _animationSize;
  Animation<double> _screenRotation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    _animationPosition = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          0.4,
          curve: Curves.easeInCubic,
        ),
      ),
    );

    _animationSize = Tween<double>(begin: 1, end: 15).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.4,
          0.8,
          curve: Curves.easeInCubic,
        ),
      ),
    );

    _screenRotation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.8,
          1,
          curve: Curves.easeInCubic,
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Opacity(
          opacity: _screenRotation.value > 0.5 ? 0 : 1,
          child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..rotateY(
                math.pi * _screenRotation.value,
              ),
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Complex Animation'),
              ),
              floatingActionButton: FloatingActionButton(
                child: const Icon(
                  Icons.play_arrow,
                ),
                onPressed: () {
                  _animationController.forward();
                },
              ),
              body: Stack(
                alignment: Alignment.center,
                children: [
                  Transform.translate(
                    offset: Offset(
                      _screenSize.width / 2 -
                          100 * (1 - _animationPosition.value),
                      _screenSize.height / 2,
                    ),
                    child: const _Dot(
                      color: Colors.blue,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(
                      _screenSize.width / 2,
                      _screenSize.height / 2,
                    ),
                    child: const _Dot(
                      color: Colors.red,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(
                      _screenSize.width / 2 +
                          100 * (1 - _animationPosition.value),
                      _screenSize.height / 2,
                    ),
                    child: ScaleTransition(
                      scale: _animationSize,
                      child: const _Dot(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (_screenRotation.value > 0.5)
          Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..rotateY(
                -math.pi * (1 - _screenRotation.value),
              ),
            child: Scaffold(
              backgroundColor: Colors.grey,
              appBar: AppBar(
                title: const Text('Complex Animation'),
              ),
              body: Center(
                child: RaisedButton(
                  child: const Text('GoBack'),
                  onPressed: () {
                    _animationController.reverse();
                  },
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    Key key,
    this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color ?? Colors.black,
      radius: 10,
    );
  }
}
