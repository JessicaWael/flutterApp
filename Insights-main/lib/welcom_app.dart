import 'package:app/generated/l10n.dart';
import 'package:app/src/feature/subscription/view/subscription_screen.dart';
import 'package:app/src/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WelcomeApp extends StatelessWidget {
  static const String routeName = 'WelcomeApp';
  const WelcomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/images/welcome_app.svg',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Spacer(),
                CustomButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        SubscriptionScreen.routeName, (route) => false);
                  },
                  title: S.of(context).GET_STARTED,
                  borderSideColor: Color(0xffB3B3B3),
                  textColor: Colors.black,
                ),
                Gap(30.h),
              ],
            ),
          ),
        )
      ],
    );
  }
}
