import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {  @override
  final String text;
  final Color bgColor;
  final Color textColor;

  const Button({super.key, required this.text, required this.bgColor, required this.textColor});

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        child: Text(text, style: TextStyle(color: textColor, fontSize: 20)),
      ),
    );
  }
}
