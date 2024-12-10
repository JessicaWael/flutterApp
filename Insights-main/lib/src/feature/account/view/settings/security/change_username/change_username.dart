import 'package:app/generated/l10n.dart';
import 'package:app/src/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

//import '../../../../../../../api_connection/api_connection.dart';

class ChangeUserNameScreen extends StatefulWidget {
  static const routeName = 'ChangeUserNameScreen';
  const ChangeUserNameScreen({super.key});

  @override
  _ChangeUserNameScreenState createState() => _ChangeUserNameScreenState();
}

class _ChangeUserNameScreenState extends State<ChangeUserNameScreen> {
  TextEditingController usernameTextFieldController = TextEditingController();
  String currentUsername = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCurrentUsername();
  }

  Future<void> _fetchCurrentUsername() async {
    print("Fetching current username...");

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? userId = prefs.getInt('userId');
      print("User ID from SharedPreferences: $userId");

      if (userId != null) {
        final response = await http.get(
          Uri.parse(
              'http://192.168.1.2/insghts/get_username.php?userId=$userId'),
        );
        print("Response body: ${response.body}");

        if (response.statusCode == 200) {
          setState(() {
            currentUsername = json.decode(response.body)['u_name'];
            isLoading = false;
          });
        } else {
          _showErrorMessage('Error fetching username: ${response.body}');
        }
      } else {
        _showErrorMessage('User ID is null.');
      }
    } catch (error) {
      _showErrorMessage('An error occurred. Please try again later.');
      print("Error: $error");
    }
  }

  Future<void> _changeUsername() async {
    String newUsername = usernameTextFieldController.text.trim();
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? userId = prefs.getInt('userId');
      print("User ID from SharedPreferences for changing username: $userId");

      if (userId != null) {
        final response = await http.post(
          Uri.parse('http://192.168.1.2/insghts/change_username.php'),
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          body: {'new_username': newUsername, 'u_id': userId.toString()},
        );

        if (response.statusCode == 200) {
          print('Username updated successfully!');
          Navigator.pushNamed(context, 'SettingsScreen');
        } else {
          _showErrorMessage('Error updating username: ${response.body}');
        }
      } else {
        _showErrorMessage('User ID is null.');
      }
    } catch (error) {
      _showErrorMessage('An error occurred. Please try again later.');
      print("Error: $error");
    }
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
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
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).Change_Username,
                      style: TextStyle(
                          fontSize: 26.sp, fontWeight: FontWeight.bold),
                    ),
                    Gap(50.h),
                    Text(
                      '${S.of(context).Current_Username}\n$currentUsername',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Gap(55.h),
                    TextField(
                      controller: usernameTextFieldController,
                      decoration: InputDecoration(
                        labelText: S.of(context).New_Username,
                      ),
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Gap(50.h),
                    Align(
                      alignment: Alignment.center,
                      child: CustomButton(
                        onPressed: _changeUsername,
                        title: S.of(context).Submit,
                        backgroundColor: Color(0xffE4F3F8),
                        borderSideColor: Colors.black,
                        noBackground: true,
                        textColor: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
