// ignore_for_file: prefer_const_constructors

import 'package:app/generated/l10n.dart';
import 'package:app/src/feature/auth/register/view/information_user.dart';
import 'package:app/src/feature/auth/register/view/widget/textform_details_user_screen.dart';
import 'package:app/src/feature/auth/register/view_model/register_view_model.dart';
import 'package:app/src/widget/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../../main.dart';

class DetailsUserScreen extends StatefulWidget {
  static const routeName = 'DetailsUserScreen';

  @override
  State<DetailsUserScreen> createState() => _DetailsUserScreenState();
}

class _DetailsUserScreenState extends State<DetailsUserScreen> {
  RegisterViewModel viewModel = RegisterViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: ChangeNotifierProvider<RegisterViewModel>(
          create: (context) => viewModel,
          child: Form(
            key: viewModel.formKey,
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
                      Gap(60.h),
                      Text(
                        S.of(context).hey_there_whats_your_name,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Gap(50.h),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormDetailsScreen(
                              controller: viewModel.firsNameController,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return S.of(context).enter_first_name;
                                }
                                return null;
                              },
                              title: S.of(context).first_name,
                            ),
                          ),
                          Gap(50.w),
                          Expanded(
                            child: TextFormDetailsScreen(
                              controller: viewModel.lastNameController,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return S.of(context).enter_last_name;
                                }
                                return null;
                              },
                              title: S.of(context).last_name,
                            ),
                          )
                        ],
                      ),
                      Gap(50.h),
                      TextFormDetailsScreen(
                        controller: viewModel.userNameController,
                        title: S.of(context).user_name,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return S.of(context).enter_user_name;
                          }
                          return null;
                        },
                      ),
                      Gap(MediaQuery.of(context).size.height * 0.19),
                      CustomButton(
                        onPressed: () async {
                          if (viewModel.formKey.currentState!.validate()) {
                             sharedpref!.setString("fname", viewModel.firsNameController!.text);
                           sharedpref!.setString("lname", viewModel.lastNameController!.text);
                           sharedpref!.setString("uname", viewModel.userNameController!.text);

                          Navigator.of(context)
                                .pushNamed(InformationUser.routeName);
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
      ),
    ));
  }
}
