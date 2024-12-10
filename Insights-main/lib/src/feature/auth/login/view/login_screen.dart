import 'dart:convert';
import 'package:app/generated/l10n.dart';
import 'package:app/src/feature/auth/login/view/forget_password.dart';
import 'package:app/src/feature/auth/login/view_model/login_view_model.dart';
import 'package:app/src/feature/auth/register/view/register_screen.dart';
import 'package:app/src/feature/auth/userPreferences/user_prefrences.dart';
import 'package:app/src/feature/auth/widget/app_divider.dart';
import 'package:app/src/feature/auth/widget/sgin.dart';
import 'package:app/src/feature/auth/widget/sign_with.dart';
import 'package:app/src/feature/init_home/view/init_home_screen.dart';
import 'package:app/src/widget/custom_button.dart';
import 'package:app/src/widget/custom_text_fomr_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../../../../api_connection/api_connection.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:app/models/user.dart' as app_user;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:app/src/feature/auth/login/view/login_screen_google.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
//import 'package:app/models/user.dart' as app_user;
import 'package:http/http.dart' as http;
import 'package:app/src/feature/auth/register/repository/auth_repository.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel viewModel = LoginViewModel();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/images/background_login.svg',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        ChangeNotifierProvider<LoginViewModel>(
          create: (context) => viewModel,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 35.w),
                child: SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Form(
                      key: viewModel.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Gap(200.h),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              S.of(context).LOGIN,
                              style: TextStyle(
                                fontSize: 32.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Gap(25.h),
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
                                return "Enter your email";
                              }
                              return null;
                            },
                            hintText: "Enter your email",
                          ),
                          Gap(25.h),
                          Text(
                            S.of(context).PASSWORD,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          CustomTextFormField(
                            controller: viewModel.passwordController,
                            hintText: "Enter your password",
                            isPassword: true,
                            obscureText: true,
                            myValidator: (text) {
                              if (text == null || text.isEmpty) {
                                return S.of(context).enter_your_password;
                              }
                              return null;
                            },
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(ForGetPassword.routeName);
                              },
                              child: Text(
                                S.of(context).forget_password,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                          Gap(5.h),
                          // MyDivider(title: S.of(context).or),
                          Gap(15.h),
                          //GoogleLogin(),
                          Gap(60.h),
                          CustomButton(
                            onPressed: () async {
                              if (viewModel.formKey.currentState!.validate()) {
                                await loginUserNow();
                              }
                            },
                            title: S.of(context).LOGIN,
                            textColor: Colors.black,
                            borderSideColor: Color(0xffD9D9D9),
                          ),
                          Gap(30.h),
                          Sign(
                            title1: "You don\'t have an account?",
                            title2: S.of(context).SIGN_UP,
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(RegisterScreen.routeName);
                            },
                          )
                        ],
                      ),
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

  loginUserNow() async {
    try {
      var res = await http.post(
        Uri.parse(API.login),
        body: {
          "u_email": viewModel.emailController.text.trim(),
          "u_password": viewModel.passwordController.text.trim(),
        },
        headers: {
          "Accept": "application/json",
        },
      );

      print('Response status: ${res.statusCode}');
      print('Response body: ${res.body}');

      if (res.statusCode == 200) {
        if (res.headers['content-type']?.contains('application/json') ??
            false) {
          try {
            var resBodyOfLogin = jsonDecode(res.body);

            if (resBodyOfLogin['success'] == true) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("You logged in successfully"),
              ));

              app_user.User userInfo =
                  app_user.User.fromJson(resBodyOfLogin["userData"]);
              await RememberUserPrefs.saveRememberUser(userInfo);

              // Save user's ID to SharedPreferences
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setInt('userId', userInfo.id);
              await prefs.setString('firstName', userInfo.firstName);

              Navigator.of(context).pushNamed(InitHomeScreen.routeName);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                    resBodyOfLogin['message'] ?? "Incorrect password or email"),
              ));
            }
          } catch (e) {
            print("Error parsing JSON: ${e.toString()}");
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("An error occurred while processing your request."),
            ));
          }
        } else {
          print('Unexpected content type: ${res.headers['content-type']}');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Invalid response from server."),
          ));
        }
      } else {
        print('Server error: ${res.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Server error: ${res.statusCode}"),
        ));
      }
    } catch (errorMsg) {
      print("Error: ${errorMsg.toString()}");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("An error occurred. Please try again later."),
      ));
    }
  }
  //google

  /*Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // The user canceled the sign-in
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        print('Google sign-in successful, user email: ${user.email}');
      }
    } on FirebaseAuthException catch (e) {
      print('Error during Google sign-in: ${e.message}');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error: ${e.message}'),
      ));
    } catch (e) {
      print('Error: ${e.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('An unexpected error occurred.'),
      ));
    }
  }*/
}
