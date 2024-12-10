import 'package:app/src/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CardWidgetSubscribtion extends StatelessWidget {
  String title;
  String subtitle;
  String price;
  String time;
  int value;
  int groupValue;
  void Function(int?)? onChanged;
  CardWidgetSubscribtion(
      {required this.title,
      required this.subtitle,
      required this.price,
      required this.time,
      required this.groupValue,
      required this.onChanged,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 380.w,
      // height: 105.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11.r),
        color: const Color(0xffD9D9D9),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Gap(13.h),
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Gap(40.w),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: price,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 24.sp,
                      ),
                    ),
                    TextSpan(
                      text: time,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20.sp,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
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
            ],
          ),
          // Gap(10.h),
          Text(
            subtitle,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20.sp,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
