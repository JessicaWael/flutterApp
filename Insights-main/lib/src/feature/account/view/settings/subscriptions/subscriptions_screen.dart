import 'package:app/generated/l10n.dart';
import 'package:app/src/feature/payment/view/payment_screen.dart';
import 'package:app/src/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:app/dialog_utilse.dart' as Dialog;

class SetingsSubscribtionScreen extends StatelessWidget {
  static const String routeName = 'SetingsSubscribtionScreen';
  const SetingsSubscribtionScreen({super.key});

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).Edit_Subscription,
                style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
              ),
              Gap(50.h),
              Row(
                children: [
                  Icon(
                    Icons.remove_circle_outline,
                    size: 40.sp,
                  ),
                  Gap(10.h),
                  Text(
                    S.of(context).Cancelled_subscription,
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  S
                      .of(context)
                      .Are_you_sure_you_want_to_cancel_your_subscription,
                  style: TextStyle(fontSize: 18.sp),
                ),
              ),
              Gap(20.h),
              Align(
                alignment: Alignment.center,
                child: CustomButton(
                  onPressed: () {
                    Dialog.showMassage(
                      context: context,
                      message: '',
                      body: S
                          .of(context)
                          .Are_you_sure_you_want_to_cancel_your_subscription,
                    );
                  },
                  title: S.of(context).CANCEL,
                  textColor: Colors.black,
                  backgroundColor: Color(0xffE4F3F8),
                  noBackground: true,
                  borderSideColor: Colors.black,
                ),
              ),
              Gap(20.h),
              Divider(
                color: Colors.grey,
              ),
              Gap(60.h),
              Align(
                alignment: Alignment.center,
                child: Text(
                  S.of(context).Upgrade_To_Premuim,
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
                ),
              ),
              Gap(30.h),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(PaymentScreen.routeName);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    width: 280.w,
                    height: 85.h,
                    decoration: BoxDecoration(
                      color: Color(0xffE4F3F8),
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Gap(40.h),
                        Icon(
                          Icons.paid,
                          size: 35.sp,
                        ),
                        Gap(25.h),
                        Text(
                          '${S.of(context).SUBSCRIBE}\n2\$${S.of(context).MONTH}',
                          style: TextStyle(
                              fontSize: 23.sp, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Gap(40.h),
              Text(S.of(context).THE_SUBSCRIBTION_RENEWS),
            ],
          ),
        ),
      ),
    );
  }
}
