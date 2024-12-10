import 'package:app/src/feature/feed/view/Widgets/my_cutom_text.dart';
import 'package:flutter/material.dart';

class MyTileCard extends StatelessWidget {
  final String buttonName;
  final void Function()? onPressed;
  final int index;
  final String? name, price, percentage;
  final Color color;
  const MyTileCard(
      {super.key,
      this.index = 0,
      this.buttonName = 'Hide',
      required this.name,
      required this.price,
      required this.percentage,
      this.color = Colors.red,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 18,
                  ),
                  MyCustomText(
                    text: name!,
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    width: 150,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[100],
                          foregroundColor: Colors.black87),
                      onPressed: onPressed,
                      child: MyCustomText(
                        text: buttonName,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      )),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  MyCustomText(
                    text: price!,
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 90,
                  ),
                  MyCustomText(
                    text: percentage!,
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
