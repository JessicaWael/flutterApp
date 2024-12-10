// ignore_for_file: prefer_const_constructors

import 'package:app/generated/l10n.dart';
import 'package:app/src/feature/account/view/account_screen.dart';
import 'package:app/src/feature/chatbot/chat.dart';
import 'package:app/src/feature/feed/view/feed_screen.dart';
import 'package:app/src/feature/home/view/home_screen.dart';
//import 'package:app/src/feature/Chatbot/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class InitHomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  InitHomeScreen({super.key});

  @override
  State<InitHomeScreen> createState() => _InitHomeScreenState();
}

class _InitHomeScreenState extends State<InitHomeScreen> {
  int index = 0;
  List<Widget> pages = [
    HomeScreen(),
    DataSectorScreen(),
    FeedScreen(),
    AccountScreen()
  ]; //!

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        unselectedFontSize: 13.sp,
        selectedFontSize: 13.sp,
        selectedItemColor: Color(0xffAAD6EB),
        enableFeedback: true,
        showSelectedLabels: true,
        useLegacyColorScheme: true,
        elevation: 0,
        currentIndex: index,
        onTap: (selectedIndex) {
          index = selectedIndex;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Home.svg',
              color: index == 0 ? Color(0xffAAD6EB) : null,
            ),
            label: S.of(context).Home,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/wallet.svg',
              color: index == 1 ? Color(0xffAAD6EB) : null,
            ),
            label: S.of(context).Prediction,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Chart.svg',
              color: index == 2 ? Color(0xffAAD6EB) : null,
            ),
            label: S.of(context).Feed,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/user_account.svg',
              color: index == 3 ? Color(0xffAAD6EB) : null,
            ),
            label: S.of(context).Account,
          ),
        ],
      ),
    );
  }
}
