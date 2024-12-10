// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  void Function()? onPressed;
  String title;
  Color textColor = Colors.white;
  Color borderSideColor = Colors.white;
  Color backgroundColor = Colors.white;
  bool noBackground = false;

  CustomButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.textColor = Colors.white,
    this.borderSideColor = Colors.white,
    this.backgroundColor = Colors.white,
    this.noBackground = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 62.h,
      minWidth: 250.w,
      color: noBackground ? backgroundColor : null,
      child: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: 25.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 2.w,
          color: borderSideColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(30.r),
        ),
      ),
    );
  }
}
