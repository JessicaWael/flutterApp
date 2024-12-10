import 'package:app/generated/l10n.dart';
import 'package:app/src/feature/auth/register/view/widget/textform_details_user_screen.dart';
import 'package:app/src/feature/auth/register/view_model/register_view_model.dart';
import 'package:app/src/feature/init_home/view/init_home_screen.dart';
import 'package:app/src/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../../main.dart';
import '../../../subscription/view/subscription_screen.dart';
import '../repository/auth_repository.dart';

import 'package:app/generated/l10n.dart';
import 'package:app/src/feature/auth/register/view/widget/textform_details_user_screen.dart';
import 'package:app/src/feature/auth/register/view_model/register_view_model.dart';
import 'package:app/src/feature/init_home/view/init_home_screen.dart';
import 'package:app/src/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../../main.dart';
import '../../../subscription/view/subscription_screen.dart';
import '../repository/auth_repository.dart';

class InformationUser extends StatefulWidget {
  static const String routeName = "InformationUser";

  @override
  State<InformationUser> createState() => _InformationUserState();
}

class _InformationUserState extends State<InformationUser> {
  RegisterViewModel viewModel = RegisterViewModel();
  final _birthdayController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nationalIdController = TextEditingController();
  final List<String> _nationalities = [
    'Algeria',
    'Bahrain',
    'Comoros',
    'Djibouti',
    'Egypt',
    'Iraq',
    'Jordan',
    'Kuwait',
    'Lebanon',
    'Libya',
    'Mauritania',
    'Morocco',
    'Oman',
    'Palestine',
    'Qatar',
    'Saudi Arabia',
    'Somalia',
    'Sudan',
    'Syria',
    'Tunisia',
    'United Arab Emirates',
    'Yemen',
    'Other'
  ];

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
              crossAxisAlignment: CrossAxisAlignment.center,
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
                      Gap(70.h),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: "Where are you from? (Nationality)",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        value: viewModel.nationality,
                        onChanged: (String? newValue) {
                          setState(() {
                            viewModel.nationality = newValue;
                          });
                        },
                        items: _nationalities
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please select your nationality";
                          }
                          return null;
                        },
                      ),
                      Gap(40.h),
                      TextFormField(
                        controller: _birthdayController,
                        decoration: InputDecoration(
                          labelText: 'Birthday',
                          hintText: 'MM/DD/YYYY',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        keyboardType: TextInputType.datetime,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your birthday';
                          }
                          // Add more validation logic for the date format if needed
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          hintText: 'Enter your phone number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          // Add more validation logic for phone number if needed
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _nationalIdController,
                        decoration: InputDecoration(
                          labelText: 'National ID',
                          hintText: 'Enter your national ID',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your national ID';
                          }
                          // Add more validation logic for national ID if needed
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      Gap(MediaQuery.of(context).size.height * 0.1),
                      CustomButton(
                        onPressed: () async {
                          if (viewModel.formKey.currentState!.validate()) {
                            await sharedpref!.setString(
                                "nationality", viewModel.nationality!);
                            await sharedpref!
                                .setString("bdate", _birthdayController.text);
                            await sharedpref!
                                .setString("phone", _phoneController.text);
                            await sharedpref!
                                .setString("id", _nationalIdController.text);
                            var res = await AuthRepository().signup();
                            if (res == 'success') {
                              Navigator.of(context)
                                  .pushNamed(SubscriptionScreen.routeName);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content:
                                    Text(res.toString().replaceAll('_', '')),
                              ));
                            }
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
