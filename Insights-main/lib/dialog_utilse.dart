// ignore_for_file: prefer_const_constructors

import 'package:app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showMassage({
  required BuildContext context,
  required String message,
  required String body,
}) {
  showDialog(
    context: context,
    builder: (BuildContext ctx) {
      return AlertDialog(
        backgroundColor: Color.fromARGB(159, 81, 84, 86),
        elevation: 0,
        title: Text(
          message,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        content: Text(
          body,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          // The "Yes" button
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              S.of(context).YES,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                S.of(context).NO,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ))
        ],
      );
    },
  );
}

void showSnackBar({
  required BuildContext context,
  required String message,
  required String body,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Text(
        message,
        style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w400,
          color: Color(0xff179BD7),
        ),
      ),
      // action: SnackBarAction(
      //   label: body,
      //   textColor: Colors.white,
      //   onPressed: () {},
      // ),
    ),
  );
}
