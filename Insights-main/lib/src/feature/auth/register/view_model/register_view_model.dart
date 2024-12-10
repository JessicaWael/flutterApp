import 'package:app/src/feature/account/view/change_language/change_language_screen.dart';
import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController? firsNameController = TextEditingController();
  TextEditingController? lastNameController = TextEditingController();
  TextEditingController? userNameController = TextEditingController();
  TextEditingController? nationalIDController = TextEditingController();
  TextEditingController? birthdayController = TextEditingController();
  TextEditingController? phoneController = TextEditingController();
  TextEditingController? nationalityController = TextEditingController();
  String? nationality;
  DateTime dateTime = DateTime(
    2000,
    2,
    1,
  );
}
