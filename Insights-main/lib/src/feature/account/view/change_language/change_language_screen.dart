import 'package:app/generated/l10n.dart';
import 'package:app/src/provider/change_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class changeLanguage extends StatefulWidget {
  @override
  State<changeLanguage> createState() => _changeLanguageState();
}

class _changeLanguageState extends State<changeLanguage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChangeLanguage>(context);
    return SizedBox(
      height: 290,
      child: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
              height: 10,
              width: 180,
            ),
          ),
          Gap(10.h),
          Text(
            S.of(context).Change_Language,
            style: TextStyle(fontSize: 32.sp),
          ),
          Gap(30.h),
          Container(
            height: 60,
            width: 340,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade300,
            ),
            child: Row(
              children: [
                Gap(15.h),
                Text(
                  "English",
                  style: TextStyle(
                    fontSize: 24.sp,
                  ),
                ),
                Spacer(),
                Radio(
                  value: provider.language,
                  groupValue: 'en',
                  onChanged: (value) {
                    provider.changeLanguage('en');
                  },
                ),
                Gap(15.h),
              ],
            ),
          ),
          Gap(30.h),
          Container(
            height: 60,
            width: 340,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade300,
            ),
            child: Row(
              children: [
                Gap(15.h),
                Text(
                  "عربي",
                  style: TextStyle(
                    fontSize: 24.sp,
                  ),
                ),
                Spacer(),
                Radio(
                  value: provider.language,
                  groupValue: 'ar',
                  onChanged: (value) {
                    provider.changeLanguage('ar');
                  },
                ),
                Gap(15.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
