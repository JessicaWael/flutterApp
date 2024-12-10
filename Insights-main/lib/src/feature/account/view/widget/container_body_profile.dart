// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ContainerBodyProfile extends StatelessWidget {
  String pahtSvg;
  String title;
  void Function()? onTap;
  Color iconColor = Colors.black;
  Color textColor = Colors.black;
  ContainerBodyProfile({
    Key? key,
    required this.pahtSvg,
    required this.title,
    required this.onTap,
    this.iconColor = Colors.black,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            pahtSvg,
            color: iconColor,
          ),
          Gap(6.w),
          Text(
            title,
            style: TextStyle(
              fontSize: 20.sp,
              color: textColor,
            ),
          ),
          Spacer(),
          Icon(
            Icons.navigate_next,
            size: 40,
            color: iconColor,
          ),
        ],
      ),
    );
  }
}
