// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ContainerSettings extends StatelessWidget {
  void Function()? onTap;
  String title;
  ContainerSettings({
    Key? key,
    this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Gap(6.w),
          Text(
            title,
            style: TextStyle(
              fontSize: 22.sp,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.navigate_next,
            size: 40,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
