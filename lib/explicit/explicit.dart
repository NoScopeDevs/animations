import 'package:animations_talk/explicit/animated_builder_example.dart';
import 'package:animations_talk/explicit/complex_animation.dart';
import 'package:flutter/material.dart';

class ExplicitAnimations extends StatefulWidget {
  static const String route = 'explicitAnimations';

  static Route go() {
    return MaterialPageRoute<void>(builder: (_) => ExplicitAnimations());
  }

  @override
  _ExplicitAnimationsState createState() => _ExplicitAnimationsState();
}

class _ExplicitAnimationsState extends State<ExplicitAnimations>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);
    //* Not Efficient
    // ..addListener(() {
    //   setState(() {});
    // });
    super.initState();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    print('Build WidgetTree');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explicit Animations'),
      ),
      body: ListView(
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(
                  100 * (1 - _animation.value),
                  100 * (1 - _animation.value),
                ),
                child: child,
              );
            },
            // * More Efficient
            child: _ListTile(
              title: 'AnimatedBuilder',
              onTap: () => Navigator.of(context).push(
                AnimatedBuilderExample.go(),
              ),
            ),
          ),
          SizeTransition(
            sizeFactor: _animation,
            child: _ListTile(title: 'SizeTransition'),
          ),
          FadeTransition(
            opacity: _animationController,
            child: _ListTile(
              title: 'AnimationController + Stack + Transform',
              onTap: () => Navigator.of(context).push(
                ComplexAnimation.go(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class _ListTile extends StatelessWidget {
  _ListTile({
    Key key,
    @required this.title,
    this.onTap,
  }) : super(key: key);

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    print('Build _ListTile');
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(title),
      ),
    );
  }
}
