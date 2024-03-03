import 'package:flutter/material.dart';

class StatefullApp extends StatefulWidget {
  const StatefullApp({super.key});

  @override
  State<StatefullApp> createState() => _StatefullAppState();
}

class _StatefullAppState extends State<StatefullApp> {
  int counter = 0;
  List<int> counters = [];

  @override
  void initState() {
    super.initState();
    print('initState');
  }

  /**
   * 위젯이 위젯트리에서 제거되기 전에 호출됩니다.
   */
  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  void onClick() {
    setState(() {
      counter++;
      counters.add(counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(color: Colors.red, fontSize: 40),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Click', style: TextStyle(fontSize: Theme.of(context).textTheme.titleLarge!.fontSize, color: Theme.of(context).textTheme.titleLarge!.color)),
              Text('$counter', style: TextStyle(fontSize: 30)),
              IconButton(onPressed: onClick, icon: Icon(Icons.add_box_rounded, size: 50)),
              for(var n in counters) Text('$n', style: TextStyle(fontSize: 30))
            ],
          ),
        ),
      ),
    );
  }
}
