// ignore_for_file: sort_child_properties_last

import 'package:app/generated/l10n.dart';
import 'package:app/src/feature/auth/login/view/login_screen.dart';
import 'package:app/src/feature/init_home/view/init_home_screen.dart';
import 'package:app/src/feature/payment/view/payment_screen.dart';
import 'package:app/src/feature/subscription/view/widget/card_widget_subscribtion.dart';
import 'package:app/src/feature/subscription/view_model/subscription_view_model.dart';
import 'package:app/src/widget/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../main.dart';
import '../../auth/register/repository/auth_repository.dart';

class SubscriptionScreen extends StatefulWidget {
  static const String routeName = 'SubscribtionScreen';

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  SubscriptionViewModel viewModel = SubscriptionViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SubscriptionViewModel>(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).GO_PREMIUM,
            style: TextStyle(
              color: Colors.white,
              fontSize: 40.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/preview1.png',
                    width: 300,
                    height: 300,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        CardWidgetSubscribtion(
                          title: S.of(context).WEEKLY,
                          subtitle: S.of(context).PAY_WEEKLY_CANCEL_ANY_TIME,
                          price: '\$1',
                          time: S.of(context).WEEK,
                          value: viewModel.weekly,
                          groupValue: viewModel.selectedRadio!,
                          onChanged: (value) {
                            viewModel.selectedRadio = value;
                            setState(() {});
                          },
                        ),
                        Gap(30.h),
                        CardWidgetSubscribtion(
                          title: S.of(context).MONTHLY,
                          subtitle: S.of(context).PAY_MONTHLY_CANCEL_ANY_TIME,
                          price: '\$4',
                          time: S.of(context).MONTH,
                          value: viewModel.monthly,
                          groupValue: viewModel.selectedRadio!,
                          onChanged: (value) {
                            viewModel.selectedRadio = value;
                            setState(() {});
                          },
                        ),
                        Gap(30.h),
                        CardWidgetSubscribtion(
                          title: S.of(context).FREE_TRAIL,
                          subtitle: S.of(context).STAT_FREE_TRAIL_FOR_3_MONTHS,
                          price: '',
                          time: '',
                          value: viewModel.freeTrail,
                          groupValue: viewModel.selectedRadio!,
                          onChanged: (value) {
                            viewModel.selectedRadio = value;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  Gap(20.h),
                  CustomButton(
                    onPressed: () {
                      // Navigator.of(context).pushNamed(PaymentScreen.routeName);
                     if( viewModel.selectedRadio == viewModel.freeTrail)
                          {
                            sharedpref!.setInt("subscribe", 1);
                            AuthRepository().subscribeUser(3);
                            Navigator.of(context)
                                .pushNamed(InitHomeScreen.routeName);
                          }

                          else{ Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) =>

                          PaymentScreen(type:viewModel.selectedRadio)));}
                    },
                    title: S.of(context).CONTINUE,
                  ),
                  Gap(20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
