import 'package:app/generated/l10n.dart';
import 'package:app/src/feature/auth/login/view/confirm_forget_emial_screen.dart';
import 'package:app/src/feature/auth/login/view_model/login_view_model.dart';
import 'package:app/src/widget/custom_button.dart';
import 'package:app/src/widget/custom_text_fomr_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:email_otp/email_otp.dart';
import '../../../../../api_connection/api_connection.dart';

class ForGetPassword extends StatefulWidget {
  static const String routeName = 'ForGetPassword';

  @override
  State<ForGetPassword> createState() => _ForGetPasswordState();
}

class _ForGetPasswordState extends State<ForGetPassword> {
  LoginViewModel viewModel = LoginViewModel();
  late EmailOTP myauth;

  @override
  void initState() {
    super.initState();
    myauth = EmailOTP();
  }

  void sendOTP() async {
    final email = viewModel.emailController.text.trim();

    // Check if the email exists in the database
    var res = await http.post(
      Uri.parse(API.passEmailCheck),
      body: {"u_email": email},
    );

    if (res.statusCode == 200) {
      var resBody = jsonDecode(res.body);
      if (resBody['success'] == true) {
        // Send OTP
        myauth.setConfig(
          appEmail: "me@rohitchouhan.com",
          appName: "Insights",
          userEmail: email,
          otpLength: 4,
          otpType: OTPType.digitsOnly,
        );
        bool otpSent = await myauth.sendOTP();
        if (otpSent) {
          Navigator.of(context).pushNamed(
            ConFirmForgetEmialScreen.routeName,
            arguments: {
              'myauth': myauth,
              'email': email, // Pass the email to the next screen
            },
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to send OTP. Please try again.")),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Email not registered.")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Server error. Please try again later.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/images/background_login.svg',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Form(
          key: viewModel.formKey,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 35.w),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Gap(200.h),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            S.of(context).forget_password,
                            style: TextStyle(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Gap(60.h),
                        Text(
                          S.of(context).EMAIL,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        CustomTextFormField(
                          controller: viewModel.emailController,
                          myValidator: (text) {
                            if (text == null || text.isEmpty) {
                              return S.of(context).enter_emial;
                            }
                            return null;
                          },
                          hintText: S.of(context).enter_emial,
                        ),
                        Gap(100.h),
                        CustomButton(
                          onPressed: () {
                            if (viewModel.formKey.currentState!.validate()) {
                              sendOTP();
                            }
                          },
                          title: S.of(context).CONTINUE,
                          textColor: Colors.black,
                          borderSideColor: Color(0xffD9D9D9),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
