import 'package:app/src/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef Validator = String? Function(String?);

class CustomTextFormField extends StatefulWidget {
  TextInputType keyboardType;
  String hintText;
  bool obscureText;
  bool isPhone;
  bool isPassword;
  TextEditingController controller;
  Validator myValidator;

  CustomTextFormField(
      {this.keyboardType = TextInputType.text,
      required this.hintText,
      this.obscureText = false,
      this.isPhone = false,
      this.isPassword = false,
      required this.controller,
      required this.myValidator});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.h),
      child: TextFormField(
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          // fillColor: Colors.grey.shade100,
          // filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
            color: Color(0xffD9D9D9),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    widget.obscureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Color(0xff454A4F),
                    size: 24.sp,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.obscureText = !widget.obscureText;
                    });
                  },
                )
              : null,

          contentPadding:
              EdgeInsets.symmetric(horizontal: 11.sp, vertical: 11.sp),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(113.r),
            borderSide: const BorderSide(
              width: 2,
              color: Color(0xffD9D9D9),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(113.r),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(113.r),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
        ),
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        validator: widget.myValidator,
      ),
    );
  }
}
