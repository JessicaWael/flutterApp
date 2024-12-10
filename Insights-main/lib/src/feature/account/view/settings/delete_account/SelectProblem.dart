import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectProblem extends StatelessWidget {
  final String title;
  final String groupValue;
  final String myValue;
  final VoidCallback callBack;

  const SelectProblem({
    required this.title,
    required this.groupValue,
    required this.myValue,
    required this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callBack,
      child: Row(
        children: [
          Radio<String>(
            value: myValue,
            groupValue: groupValue,
            onChanged: (value) {
              callBack();
            },
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 18.sp),
            ),
          ),
        ],
      ),
    );
  }
}
