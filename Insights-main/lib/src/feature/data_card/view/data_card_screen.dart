// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app/generated/l10n.dart';
import 'package:app/src/feature/auth/login/view/login_screen.dart';
import 'package:app/src/feature/data_card/view_model/data_card_view_model.dart';
import 'package:app/src/feature/data_card/view/widget/custom_box_container.dart';

import 'package:app/src/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class DataCardScreen extends StatefulWidget {
  static const String routeName = 'DataCardScreen';

  @override
  State<DataCardScreen> createState() => _DataCardScreenState();
}

class _DataCardScreenState extends State<DataCardScreen> {
  DataCardViewModel viewModel = DataCardViewModel();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/images/backgroundPY.svg',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        ChangeNotifierProvider<DataCardViewModel>(
          create: (context) => viewModel,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Form(
                      key: viewModel.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Gap(130.h),
                          CustomBoxContainer(
                            title: S.of(context).name,
                            hintText: S.of(context).enter_name,
                            controller: viewModel.nameController,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return S.of(context).enter_name;
                              }
                              return null;
                            },
                          ),
                          Gap(20.h),
                          CustomBoxContainer(
                            title: S.of(context).card_number,
                            hintText: "0000 0000 0000 0000",
                            isCard: true,
                            controller: viewModel.CardNumberController,
                            isNumber: true,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return S.of(context).enter_card_number;
                              }
                              if (text.length != 16) {
                                return S.of(context).enter_valid_number;
                              }
                              return null;
                            },
                          ),
                          Gap(30.h),
                          Row(
                            children: [
                              CustomBoxContainer(
                                title: S.of(context).CVV,
                                hintText: "000",
                                width: 200.w,
                                isNumber: true,
                                controller: viewModel.cvvController,
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return S.of(context).enter_CVV;
                                  }
                                  if (text.length != 3) {
                                    return S.of(context).enter_valid_cvv;
                                  }
                                  return null;
                                },
                              ),
                              Spacer(),
                              CustomBoxContainer(
                                title: S.of(context).expires,
                                hintText: "MM/YY",
                                width: 200.w,
                                isNumber: true,
                                controller: viewModel.expiresController,
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return S.of(context).enter_expires_date;
                                  }

                                  return null;
                                },
                              ),
                            ],
                          ),
                          Gap(110.h),
                          Center(
                            child: CustomButton(
                              onPressed: () {
                                if (viewModel.formKey.currentState!
                                    .validate()) {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      LoginScreen.routeName, (route) => false);
                                }
                              },
                              title: S.of(context).compelete_payment,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
