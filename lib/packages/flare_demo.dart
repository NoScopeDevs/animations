import 'package:flutter/material.dart';

import 'package:flare_flutter/flare_actor.dart';

class FlareScreen extends StatefulWidget {
  static const String route = 'flare';

  static Route go() => MaterialPageRoute<void>(builder: (_) => FlareScreen());

  @override
  _FlareScreenState createState() => _FlareScreenState();
}

class _FlareScreenState extends State<FlareScreen> {
  var isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(FlareScreen.route)),
      backgroundColor: isDark ? Colors.black : Colors.white,
      body: Column(
        children: [
          const Flexible(
            flex: 4,
            child: FlareActor('assets/intro.flr', animation: 'coding'),
          ),
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: () => setState(() => isDark = !isDark),
              child: FlareActor(
                'assets/switch_daytime.flr',
                animation: isDark ? 'switch_night' : 'switch_day',
              ),
            ),
          ),
          const SizedBox(height: 50.0),
        ],
      ),
    );
  }
}
