// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'package:app/src/utils/app_color.dart';

class CardWidgetPayment extends StatelessWidget {
  String svgPicture;
  String value;
  String groupValue;
  void Function(String?)? onChanged;
  CardWidgetPayment({
    Key? key,
    required this.svgPicture,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380.w,
      height: 105.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11.r),
        color: const Color(0xffD9D9D9),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            svgPicture,
            width: 130.w,
            height: 100.h,
            fit: BoxFit.fill,
          ),
          Spacer(),
          Transform.scale(
            scale: 1.8,
            child: Radio(
              value: value,
              groupValue: groupValue,
              hoverColor: AppColors.primaryColor,
              onChanged: onChanged,
              activeColor: AppColors.primaryColor,
            ),
          ),
          Gap(20.w),
        ],
      ),
    );
  }
}
