import 'dart:convert';

import 'package:app/generated/l10n.dart';
import 'package:app/src/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'delete_account_screen.dart';

class DeleteSureAccountScreen extends StatefulWidget {
  static const routeName = 'DeleteSureAccountScreen';

  @override
  _DeleteSureAccountScreenState createState() =>
      _DeleteSureAccountScreenState();
}

class _DeleteSureAccountScreenState extends State<DeleteSureAccountScreen> {
  final _reasonController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arg = ModalRoute.of(context)!.settings.arguments as ContantListitme;
    _reasonController.text = arg.title;
  }

  Future<void> _deleteAccount(String reason) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? userId = prefs.getInt('userId');

    if (userId == null) {
      ('User ID not found. Please login again.');
      return;
    }

    try {
      final Uri uri =
          Uri.parse('http://192.168.1.2/insghts/delete_account.php');
      final http.Response response = await http.post(
        uri,
        body: {
          'u_id': userId.toString(),
          // 'reason': reason,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        if (data.containsKey('success')) {
          // Clear SharedPreferences
          await prefs.clear();

          // Navigate to login screen
          Navigator.of(context).pushReplacementNamed('LoginScreen');
        } else {
          ('Failed to delete account: ${data['error']}');
        }
      } else {
        ('Failed to delete account: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error deleting account: $e');
      ('An error occurred while deleting account. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Text(
                S.of(context).Delete_Account,
                style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                S.of(context).Can_you_tell_us_why_you_want_to_leave,
                style: TextStyle(fontSize: 20.sp),
              ),
              Gap(20.h),
              TextFormField(
                controller: _reasonController,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 40.sp,
                  ),
                  enabledBorder: UnderlineInputBorder(),
                ),
              ),
              Gap(70.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Color(0xffE4F3F8),
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade700,
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).Note_That,
                      style: TextStyle(
                          fontSize: 24.sp, fontWeight: FontWeight.bold),
                    ),
                    Gap(3.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        S
                            .of(context)
                            .Account_Reactivation_is_possible_within_30_Days,
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(190.h),
              CustomButton(
                onPressed: () {
                  _deleteAccount(_reasonController.text);
                },
                title: S.of(context).Delete_Account,
                noBackground: true,
                textColor: Colors.black,
                backgroundColor: Color(0xffEFA9B6),
              ),
              Gap(40.h),
              CustomButton(
                onPressed: () {
                  // Navigate to settings home screen
                  Navigator.of(context).pushReplacementNamed('SettingsScreen');
                },
                title: S.of(context).Keep_account,
                textColor: Colors.black,
                borderSideColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
