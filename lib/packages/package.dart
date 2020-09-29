import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:animations/animations.dart';

import '../packages/flare_demo.dart';

class PackageAnimations extends StatefulWidget {
  static const String route = 'packageAnimations';

  static Route go() {
    return MaterialPageRoute<void>(builder: (_) => PackageAnimations());
  }

  @override
  _PackageAnimationsState createState() => _PackageAnimationsState();
}

class _PackageAnimationsState extends State<PackageAnimations> {
  final pageList = <Widget>[
    const _OpenContainerPage(),
    const _Dummy(color: Colors.deepPurple),
    const _Dummy(color: Colors.indigo),
  ];

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SlideInDown(child: const Text(PackageAnimations.route)),
        actions: [
          IconButton(
            icon: const Icon(Icons.flare),
            onPressed: () => Navigator.of(context).push(FlareScreen.go()),
          )
        ],
      ),
      body: PageTransitionSwitcher(
        duration: const Duration(seconds: 4),
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return FadeThroughTransition(
            child: child,
            animation: animation,
            secondaryAnimation: secondaryAnimation,
          );

          // * another transition

          // return SharedAxisTransition(
          //   child: child,
          //   animation: animation,
          //   secondaryAnimation: secondaryAnimation,
          //   transitionType: SharedAxisTransitionType.horizontal,
          // );
        },
        child: pageList[pageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (int newValue) => setState(() => pageIndex = newValue),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            title: Text('Albums'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            title: Text('Photos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
        ],
      ),
    );
  }
}

class _OpenContainerPage extends StatelessWidget {
  const _OpenContainerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10.0),
      children: [
        OpenContainer<bool>(
          openBuilder: (_, __) => const _Dummy(color: Colors.amber),
          closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          closedBuilder: (_, __) {
            return const ListTile(title: Text('OpenContainer'));
          },
          transitionType: ContainerTransitionType.fade,
          closedElevation: 5,
          transitionDuration: const Duration(seconds: 4),
        ),
      ],
    );
  }
}

class _Dummy extends StatelessWidget {
  const _Dummy({Key key, @required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: const CircleAvatar(child: BackButton()),
      alignment: Alignment.center,
    );
  }
}
