// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'dart:async';

import 'package:app/generated/l10n.dart';
import 'package:app/src/feature/auth/register/view/password_screen.dart';
import 'package:app/src/utils/app_color.dart';
import 'package:app/src/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:gap/gap.dart';
import 'package:app/dialog_utilse.dart' as Dialog;

class SendConFirmScreen extends StatefulWidget {
  static const String routeName = 'SendConFirmScreen';
  const SendConFirmScreen({super.key});

  @override
  State<SendConFirmScreen> createState() => _ConFirmEmailScreenState();
}

class _ConFirmEmailScreenState extends State<SendConFirmScreen> {
  bool isResendAgain = false;

  bool isVerified = false;

  bool isLoading = false;

  String code = '';

  late Timer timer;
  int start = 60;
  //////////////////////////////////////////
  void resend() {
    setState(() {
      isResendAgain = true;
    });

    timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        setState(() {
          if (start == 0) {
            isResendAgain = false;
            start = 60;
            timer.cancel();
          } else {
            start--;
          }
        });
      },
    );
  }

  void verify() {
    setState(() {
      isLoading = true;
    });
    timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        isLoading = false;
        isVerified = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Gap(MediaQuery.of(context).size.height * 0.22),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.78,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(65.r),
                  topRight: Radius.circular(65.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Gap(10.h),
                  Text(
                    S.of(context).Confirm,
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gap(40.h),
                  Text(
                    S.of(context).ENTER_THE_CODE_WE_SENT_TO_YOU,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Gap(23.h),
                  Text(
                    S.of(context).WE_SENT_6_DIGIT_CODE_TO_YOUR_EMAIL_ADDRESS,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    S.of(context).ENTER_THAT_CODE_TO_RESET_YOUR_PASSWORD,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                  Gap(20.h),
                  Center(
                    child: VerificationCode(
                      length: 4,
                      textStyle: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryColor,
                      ),
                      fullBorder: true,
                      margin: EdgeInsets.all(10.sp),
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.sp, vertical: 13.sp),
                      underlineColor: AppColors.primaryColor,
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      onCompleted: (value) {
                        code = value;
                      },
                      onEditing: (value) {},
                    ),
                  ),
                  Gap(20.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/telegram.svg',
                        height: 24.h,
                        width: 24.w,
                      ),
                      Gap(5.w),
                      TextButton(
                        onPressed: () {
                          if (isResendAgain) return;
                          resend();
                        },
                        child: Text(
                          isResendAgain == true
                              ? S.of(context).Try_again_in + start.toString()
                              : S.of(context).SEND_EMAIL_AGINE,
                          style: TextStyle(
                            fontSize: 17.sp,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(MediaQuery.of(context).size.height * 0.18),
                  CustomButton(
                    onPressed: code.length < 4
                        ? null
                        : () {
                            Dialog.showSnackBar(
                                context: context,
                                message: S
                                    .of(context)
                                    .Your_Email_Changed_Successfully,
                                body: '');
                          },
                    title: S.of(context).CONTINUE,
                    textColor: Colors.black,
                    borderSideColor: Color(0xffD9D9D9),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
