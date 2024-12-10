// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Sign extends StatelessWidget {
  String title1;
  String title2;
  void Function() onPressed;
  Sign({
    Key? key,
    required this.title1,
    required this.title2,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title1,
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            title2,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}
