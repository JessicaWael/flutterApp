import 'dart:async';
import 'package:app/generated/l10n.dart';
import 'package:app/src/feature/auth/login/view/reset_password_screen.dart';
import 'package:app/src/utils/app_color.dart';
import 'package:app/src/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:gap/gap.dart';
import 'package:email_otp/email_otp.dart';

class ConFirmForgetEmialScreen extends StatefulWidget {
  static const String routeName = 'ConFirmForgetEmialScreen';
  const ConFirmForgetEmialScreen({super.key});

  @override
  State<ConFirmForgetEmialScreen> createState() => _ConFirmEmailScreenState();
}

class _ConFirmEmailScreenState extends State<ConFirmForgetEmialScreen> {
  bool isResendAgain = false;
  bool isVerified = false;
  bool isLoading = false;
  String code = '';
  late Timer timer;
  int start = 60;
  late EmailOTP myauth;
  late String email;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    myauth = args['myauth'] as EmailOTP;
    email = args['email'] as String;
  }

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
                    Gap(5.h),
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
                          onPressed: () async {
                            if (isResendAgain) return;
                            if (await myauth.sendOTP() == true) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("OTP has been sent again"),
                                ),
                              );
                              resend();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Oops, OTP send failed"),
                                ),
                              );
                            }
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
                    Gap(MediaQuery.of(context).size.height * 0.19),
                    CustomButton(
                      onPressed: () async {
                        if (code.length == 4) {
                          setState(() {
                            isLoading = true;
                          });
                          if (await myauth.verifyOTP(otp: code) == true) {
                            setState(() {
                              isLoading = false;
                              isVerified = true;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("OTP is verified"),
                              ),
                            );
                            Navigator.of(context).pushNamed(
                              ResetPsswordScreen.routeName,
                              arguments:
                                  email, // Pass the email to the next screen
                            );
                          } else {
                            setState(() {
                              isLoading = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Invalid OTP"),
                              ),
                            );
                          }
                        }
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
      ),
    );
  }
}
