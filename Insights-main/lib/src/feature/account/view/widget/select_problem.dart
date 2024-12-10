// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/src/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SelectProblem extends StatefulWidget {
  String myValue, groupValue, title;
  void Function()? callBack;
  SelectProblem({
    Key? key,
    required this.title,
    required this.groupValue,
    required this.myValue,
    required this.callBack,
  }) : super(key: key);

  @override
  State<SelectProblem> createState() => _SelectProblemState();
}

class _SelectProblemState extends State<SelectProblem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.callBack,
      child: Row(
        children: [
          Transform.scale(
            scale: 1.8,
            child: Radio(
              value: widget.myValue,
              groupValue: widget.groupValue,
              hoverColor: AppColors.primaryColor,
              onChanged: (value) {
                widget.myValue = value.toString();
                setState(() {});
              },
              activeColor: AppColors.primaryColor,
            ),
          ),
          Gap(10.w),
          Container(
            constraints: BoxConstraints(maxWidth: 360.w),
            child: Text(
              widget.title,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
