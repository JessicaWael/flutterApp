import 'package:flutter/material.dart';

class MyCustomText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  
  const MyCustomText(
      {super.key,
      required this.text,
      this.fontWeight = FontWeight.normal,
      this.fontSize = 15,
      this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
    );
  }
}
