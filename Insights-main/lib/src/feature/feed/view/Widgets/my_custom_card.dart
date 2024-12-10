import 'package:app/src/feature/feed/view/Widgets/my_cutom_text.dart';
import 'package:flutter/material.dart';

class MyCustomCard extends StatelessWidget {
  final String price, name, percentage;
  const MyCustomCard(
      {super.key,
      required this.price,
      required this.name,
      required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: MyCustomText(
              text: price,
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          MyCustomText(
            text: name,
            fontSize: 21,
            fontWeight: FontWeight.w800,
          ),
          const SizedBox(
            height: 25,
          ),
          MyCustomText(
            text: percentage,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
