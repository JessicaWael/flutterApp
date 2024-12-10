import 'package:app/generated/l10n.dart';
import 'package:app/src/feature/auth/register/view/details_user_screen.dart';
import 'package:app/src/feature/auth/register/view_model/register_view_model.dart';
import 'package:app/src/widget/custom_button.dart';
import 'package:app/src/widget/custom_text_fomr_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../../main.dart';

class PasswordScreen extends StatefulWidget {
  static const String routeName = 'PasswordScreen';

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  RegisterViewModel viewModel = RegisterViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ChangeNotifierProvider<RegisterViewModel>(
        create: (context) => viewModel,
        child: SingleChildScrollView(
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
                      Gap(10.h),
                      Text(
                        S.of(context).PASSWORD,
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Gap(60.h),
                      Text(
                        S.of(context).CREATE_YOUR_PASSWORD,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      CustomTextFormField(
                        hintText: S.of(context).enter_password,
                        controller: viewModel.passwordController,
                        myValidator: (text) {
                          if (text == null || text.isEmpty) {
                            return S.of(context).enter_password;
                          }
                          return null;
                        },
                        isPassword: true,
                        obscureText: true,
                      ),
                      Gap(40.h),
                      Text(
                        S.of(context).CONFIRM_THE_PASSWORD,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      CustomTextFormField(
                        hintText: S.of(context).enter_password,
                        controller: viewModel.confirmPasswordController,
                        myValidator: (text) {
                          if (text == null || text.isEmpty) {
                            return S.of(context).enter_password;
                          }
                          if (text != viewModel.passwordController.text) {
                            return S.of(context).password_not_match;
                          }
                          return null;
                        },
                        isPassword: true,
                        obscureText: true,
                      ),
                      Gap(MediaQuery.of(context).size.height * 0.22),
                      CustomButton(
                        onPressed: () async {
                          if (viewModel.formKey.currentState!.validate()) {
                           await sharedpref!.setString("password", viewModel.passwordController.text);
                            Navigator.of(context)
                                .pushNamed(DetailsUserScreen.routeName);
                          }
                        },
                        title: S.of(context).Confirm,
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
    ;
  }
}
