import 'package:app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotifivationsScreen extends StatelessWidget {
  static const routeName = 'NotifivationsScreen';
  const NotifivationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).Notifications,
              style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
