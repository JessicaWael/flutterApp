import 'dart:convert';
import 'package:app/generated/l10n.dart';
import 'package:app/src/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:email_otp/email_otp.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../auth/register/repository/auth_repository.dart';
import '../../../../../../../api_connection/api_connection.dart';

EmailOTP myauth = EmailOTP();

class ChangeEmailScreen extends StatefulWidget {
  static const routeName = 'ChangeEmailScreen';
  const ChangeEmailScreen({super.key});

  @override
  _ChangeEmailScreenState createState() => _ChangeEmailScreenState();
}

class _ChangeEmailScreenState extends State<ChangeEmailScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _otpController = TextEditingController();
  String currentEmail = '';
  String _newEmail = '';
  bool isLoading = true;
  bool isOTPSent = false;
  bool isVerifying = false;
  bool _isOTPSent = false;

  @override
  void initState() {
    super.initState();
    _fetchCurrentEmail();
  }

  Future<void> _fetchCurrentEmail() async {
    print("Fetching current email...");

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? userId = prefs.getInt('userId');
      print("User ID from SharedPreferences: $userId");

      if (userId != null) {
        final response = await http.get(
          Uri.parse(
              'http://192.168.1.2/insghts/get_email.php?userId=$userId'),
        );
        print("Response body: ${response.body}");

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          if (data['u_email'] != null) {
            setState(() {
              currentEmail = data['u_email'];
              isLoading = false;
            });
          } else {
            _showErrorSnackbar('Failed to fetch current email');
          }
        } else {
          _showErrorSnackbar('Failed to fetch current email: ${response.body}');
        }
      } else {
        _showErrorSnackbar('User ID is null.');
      }
    } catch (error) {
      _showErrorSnackbar('An error occurred. Please try again later.');
      print("Error: $error");
    }
  }

  Future<void> _sendVerificationCode() async {
    try {
      var res = await AuthRepository().checkEmail(_emailController.text);
      if (res == 'success') {
        myauth.setConfig(
          appEmail: "me@rohitchouhan.com",
          appName: "Insights",
          userEmail: _emailController.text,
          otpLength: 4,
          otpType: OTPType.digitsOnly,
        );
        if (await myauth.sendOTP()) {
          setState(() {
            _isOTPSent = true;
            _newEmail = _emailController.text;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("OTP has been sent")),
          );
        } else {
          _showErrorSnackbar('Failed to send OTP');
        }
      } else {
        _showErrorSnackbar('Email check failed');
      }
    } catch (e) {
      _showErrorSnackbar('Error: $e');
    }
  }

  Future<void> _verifyOTP() async {
    setState(() {
      isVerifying = true;
    });

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? userId = prefs.getInt('userId');

      if (userId == null) {
        _showErrorSnackbar('User ID is not available.');
        setState(() {
          isVerifying = false;
        });
        return;
      }

      if (await myauth.verifyOTP(otp: _otpController.text)) {
        try {
          final response = await http.post(
            Uri.parse(API.ChengeEmail),
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: {'u_email': _newEmail, 'u_id': userId.toString()},
          );

          if (response.statusCode == 200) {
            final data = jsonDecode(response.body);
            if (data['success'] == true) {
              // Show SnackBar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Email updated successfully')),
              );
              // Delay navigation to ensure SnackBar is fully shown
              Future.delayed(Duration(milliseconds: 1000), () {
                Navigator.of(context).pop();
              });
            } else {
              _showErrorSnackbar(data['error'] ?? 'Failed to update email');
            }
          } else {
            _showErrorSnackbar('Error: ${response.statusCode}');
          }
        } catch (e) {
          _showErrorSnackbar('Error: $e');
        }
      } else {
        _showErrorSnackbar('Invalid OTP');
      }
    } catch (e) {
      _showErrorSnackbar('Error: $e');
    }

    setState(() {
      isVerifying = false;
    });
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : _isOTPSent
              ? SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).ENTER_THE_CODE_WE_SENT_TO_YOU,
                            style: TextStyle(
                                fontSize: 26.sp, fontWeight: FontWeight.bold),
                          ),
                          Gap(50.h),
                          TextFormField(
                            controller: _otpController,
                            decoration: InputDecoration(
                              hintText: 'Enter OTP',
                              hintStyle: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.grey,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter OTP';
                              }
                              return null;
                            },
                          ),
                          Gap(45.h),
                          Align(
                            alignment: Alignment.center,
                            child: CustomButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _verifyOTP();
                                }
                              },
                              title: 'Verify OTP',
                              backgroundColor: Color(0xffE4F3F8),
                              textColor: Colors.black,
                              borderSideColor: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).Change_Email,
                            style: TextStyle(
                                fontSize: 26.sp, fontWeight: FontWeight.bold),
                          ),
                          Gap(50.h),
                          Text(
                            '${S.of(context).Current_Email}\n$currentEmail',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Gap(55.h),
                          Text(
                            S.of(context).New_Email,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: 'user@gmail.com',
                              hintStyle: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.grey,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return S.of(context).ADD_YOUR_EMAIL;
                              }
                              return null;
                            },
                          ),
                          Gap(45.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 8.h),
                            decoration: BoxDecoration(
                              color: Color(0xffE4F3F8),
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade700,
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  S.of(context).Note_That,
                                  style: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Gap(3.h),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Text(
                                    S
                                        .of(context)
                                        .after_changing_you_email_and_any_futur_communication_will_be_sent_to_your_new_email,
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w300),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Divider(
                                  color: Color(0xff98DEF4),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Text(
                                    S.of(context).in_case_ou_entered_new_email,
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w300),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gap(50.h),
                          Align(
                            alignment: Alignment.center,
                            child: CustomButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _sendVerificationCode().catchError((error) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Error: $error')),
                                    );
                                  });
                                }
                              },
                              title: S.of(context).Send_Verification_Code,
                              backgroundColor: Color(0xffE4F3F8),
                              textColor: Colors.black,
                              borderSideColor: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }
}
