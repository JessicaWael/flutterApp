import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  // var formKeyForget = GlobalKey<FormState>();
  // var formKeyReset = GlobalKey<FormState>();
}
