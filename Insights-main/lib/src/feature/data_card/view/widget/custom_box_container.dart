import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CustomBoxContainer extends StatelessWidget {
  String title;
  String hintText;
  bool isCard;
  bool isNumber;

  double width = double.infinity;
  String? Function(String?)? validator;
  TextEditingController? controller;

  CustomBoxContainer({
    Key? key,
    required this.title,
    required this.hintText,
    this.isCard = false,
    this.isNumber = false,
    required this.controller,
    this.width = double.infinity,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          Gap(10.h),
          TextFormField(
            keyboardType: isNumber ? TextInputType.number : null,
            controller: controller,
            validator: validator,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              fillColor: Color(0xffD9D9D9),
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w400,
                color: Colors.grey[400],
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11.r),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11.r),
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
