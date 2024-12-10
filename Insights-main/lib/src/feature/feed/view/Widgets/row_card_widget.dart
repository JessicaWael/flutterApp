import 'package:app/src/feature/feed/view/Widgets/my_cutom_text.dart';
import 'package:flutter/material.dart';

class RowCardWidget extends StatelessWidget {
  final String text;
  final Color color, textColor;
  const RowCardWidget(
      {super.key,
      required this.text,
      this.color = Colors.grey,
      this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 55,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(19), color: color),
      child: Center(
          child: MyCustomText(
        text: text,
        fontWeight: FontWeight.bold,
        color: textColor,
      )),
    );
  }
}
