import 'package:app/generated/l10n.dart';
import 'package:app/src/feature/account/view/settings/security/change_email/change_email_screen.dart';
import 'package:app/src/feature/account/view/settings/security/change_username/change_username.dart';
import 'package:app/src/feature/account/view/widget/container_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SecurityScreen extends StatelessWidget {
  static const String routeName = "SecurityScreen";
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).Security,
              style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
            ),
            Gap(50.h),
            ContainerSettings(
              title: S.of(context).Change_Username,
              onTap: () {
                Navigator.of(context).pushNamed(ChangeUserNameScreen.routeName);
              },
            ),
            Gap(20.h),
            Divider(
              color: Colors.grey,
            ),
            Gap(80.h),
            ContainerSettings(
              title: S.of(context).Change_Email,
              onTap: () {
                Navigator.of(context).pushNamed(ChangeEmailScreen.routeName);
              },
            ),
            Gap(20.h),
            Divider(
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
