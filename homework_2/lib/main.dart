import 'package:flutter/material.dart';

void main() => runApp(CounterApp());

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Counter',
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Counter'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Tap "-" to decrement'),
                CounterWidget(),
                const Text('Tap "+" to increment'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() {
    return _CounterWidgetState();
  }
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 50;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          onPressed: () {
            setState(() {
              _count -= 1;
            });
          },
          icon: const Icon(Icons.volume_down),
          alignment: Alignment.center,
        ),
        TextButton(onPressed: () {}, child: Text('$_count')),
        IconButton(
          onPressed: () {
            setState(() {
              _count += 1;
            });
          },
          icon: const Icon(Icons.volume_up),
          alignment: Alignment.center,
        ),
      ],
    );
  }
}
