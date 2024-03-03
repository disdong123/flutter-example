import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const SECONDS = 1500;
  int totalSeconds = SECONDS;
  int completedPomos = 0;
  bool isRunning = false;
  late Timer timer;

  String format(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds - (minutes * 60);
    return "$minutes:${remainingSeconds.toString().padLeft(2, '0')}";
  }

  void onStartPressed() {
    print('onStartPressed');
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        totalSeconds--;
      });
      if (totalSeconds == 0) {
        totalSeconds = SECONDS;
        setState(() {
          completedPomos++;
        });
      }
    });
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    print('onPausePressed');
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onResetPressed() {
    print('onResetPressed');
    timer.cancel();
    setState(() {
      totalSeconds = SECONDS;
      isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Flexible(flex: 1, child: Container(
            alignment: Alignment.bottomCenter,
            child: Text(format(totalSeconds), style: TextStyle(color: Theme.of(context).cardColor, fontSize: 90, fontWeight: FontWeight.w600)),
          )),
          Flexible(flex: 2, child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: IconButton(
                        color: Theme.of(context).cardColor,
                        iconSize: 100,
                        onPressed: isRunning ? onPausePressed : onStartPressed,
                        icon: isRunning ? Icon(Icons.pause) : Icon(Icons.play_circle_fill_outlined)
                    )
                ),
                Center(
                    child: IconButton(
                        color: Theme.of(context).cardColor,
                        iconSize: 100,
                        onPressed: onResetPressed,
                        icon: Icon(Icons.format_color_reset_outlined)
                    )
                ),
              ],
            ),
          )),
          Flexible(flex: 1, child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("pomo", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,
                          color: Theme.of(context).textTheme.displayLarge!.color)),
                      Text("$completedPomos", style: TextStyle(fontSize: 60, fontWeight: FontWeight.w600,
                          color: Theme.of(context).textTheme.displayLarge!.color))
                    ],
                  ),
                )
              )
            ],
          )),
        ],
      )
    );
  }
}
