import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hanflix/webtoon/home-screen.dart';
import 'package:hanflix/webtoon/stateless-home-screen.dart';

class WebtoonApp extends StatelessWidget {
  const WebtoonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StatelessHomeScreen()
    );
  }
}
