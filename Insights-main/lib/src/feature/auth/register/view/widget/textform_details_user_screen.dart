// ignore_for_file: prefer_const_constructors

import 'package:app/src/feature/auth/register/view_model/register_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class TextFormDetailsScreen extends StatefulWidget {
  TextEditingController? controller = TextEditingController();
  String? Function(String?)? validator;
  String title;
  bool isSuffixIcon;
  bool isPreefixIcon;
  bool isHintText = false;
  TextInputType inputType ;
  TextFormDetailsScreen({
    required this.controller,
    required this.title,
    required this.validator,
    this.isPreefixIcon = false,
    this.isSuffixIcon = false,
    this.isHintText = false,
    this.inputType =TextInputType.text
  });

  @override
  State<TextFormDetailsScreen> createState() => _TextFormDetailsScreenState();
}

class _TextFormDetailsScreenState extends State<TextFormDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<RegisterViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Gap(8.h),
        SizedBox(
          height: 26.h,
          child: TextFormField(
            keyboardType: widget.inputType,
            controller: widget.controller,
            validator: widget.validator,
            decoration: InputDecoration(
              hintText: widget.isHintText ? "" : null,
              // contentPadding: EdgeInsets.only(left: 0, right: 0),
              prefixIcon: widget.isPreefixIcon
                  ? Icon(
                      Icons.expand_more,
                      size: 25.sp,
                    )
                  : null,
              suffixIcon: widget.isSuffixIcon
                  ? InkWell(
                      onTap: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => SizedBox(
                            height: 250.h,
                            width: double.infinity,
                            child: CupertinoDatePicker(
                              backgroundColor: Colors.white,
                              initialDateTime: provider.dateTime,
                              onDateTimeChanged: (value) {
                                provider.dateTime = value;
                              },
                              use24hFormat: true,
                              mode: CupertinoDatePickerMode.date,
                            ),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.date_range,
                        size: 24.sp,
                      ),
                    )
                  : null,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.5,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
