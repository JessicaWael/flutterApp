import 'dart:convert';

import 'package:app/generated/l10n.dart';
import 'package:app/main.dart';
import 'package:app/src/feature/auth/login/view/login_screen.dart';
import 'package:app/src/feature/auth/register/view/password_screen.dart';
import 'package:app/src/feature/init_home/view/init_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../register/repository/auth_repository.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:gap/gap.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:app/src/feature/auth/login/view/login_screen_google.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
//import 'package:app/models/user.dart' as app_user;
import 'package:http/http.dart' as http;
import '../../../../../api_connection/api_connection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/src/feature/auth/register/repository/auth_repository.dart';

class Signwith extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var res = await AuthRepository().signInWithGoogle();
        if (res == 'success') {
          Navigator.of(context).pushNamed(PasswordScreen.routeName);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(res.toString()),
          ));
        }
      },
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(
            color: Color(0xffD9D9D9),
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Gap(15.h),
            SvgPicture.asset(
              'assets/icons/icons_google.svg',
              width: 22.w,
              height: 22.h,
              fit: BoxFit.cover,
            ),
            Gap(23.w),
            Text(
              S.of(context).continue_with_Google_account,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//google login
class GoogleLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var res = await AuthRepository().loginWithGoogle();
        if (res == 'uccess') {
          Navigator.of(context).pushNamedAndRemoveUntil(
            InitHomeScreen.routeName,
            (Route<dynamic> route) => false,
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(res.toString()),
          ));
        }
      },
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(
            color: Color(0xffD9D9D9),
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Gap(15.h),
            SvgPicture.asset(
              'assets/icons/icons_google.svg',
              width: 22.w,
              height: 22.h,
              fit: BoxFit.cover,
            ),
            Gap(23.w),
            Text(
              S.of(context).continue_with_Google_account,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
