import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hanflix/pomodoro/home-screen.dart';

class PomodoroApp extends StatelessWidget {
  const PomodoroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Color(0xFFE7626C),
        textTheme: TextTheme(
          displayLarge: TextStyle(color: Color(0xFF232B55)),
        ),
        cardColor: Color(0xFFF4EDDB),
      ),
      home: HomeScreen(),
    );
  }
}
