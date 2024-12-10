// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:app/generated/l10n.dart';
import 'package:app/src/feature/account/view/settings/delete_account/delete_account_screen.dart';
import 'package:app/src/feature/account/view/notifications/notifications_screen.dart';
import 'package:app/src/feature/account/view/settings/delete_account/delete_sure_account.dart';
import 'package:app/src/feature/account/view/settings/security/change_email/change_email_screen.dart';
import 'package:app/src/feature/account/view/settings/security/change_email/send_code_confirm_screen.dart';
import 'package:app/src/feature/account/view/settings/security/change_username/change_username.dart';
import 'package:app/src/feature/account/view/settings/security/security_screen.dart';
import 'package:app/src/feature/account/view/settings/settings_screen.dart';
import 'package:app/src/feature/account/view/settings/subscriptions/subscriptions_screen.dart';
import 'package:app/src/feature/auth/login/view/confirm_forget_emial_screen.dart';
import 'package:app/src/feature/auth/login/view/forget_password.dart';
import 'package:app/src/feature/auth/login/view/login_screen.dart';
import 'package:app/src/feature/auth/login/view/reset_password_screen.dart';

import 'package:app/src/feature/auth/register/view/confirm_email_screen.dart';
import 'package:app/src/feature/auth/register/view/details_user_screen.dart';
import 'package:app/src/feature/auth/register/view/information_user.dart';
import 'package:app/src/feature/auth/register/view/password_screen.dart';
import 'package:app/src/feature/auth/register/view/register_screen.dart';
import 'package:app/src/feature/data_card/view/data_card_screen.dart';
import 'package:app/src/feature/init_home/view/init_home_screen.dart';
import 'package:app/src/feature/payment/view/PaymentwWthCard.dart';
import 'package:app/src/feature/payment/view/payment_screen.dart';
import 'package:app/src/feature/subscription/view/subscription_screen.dart';
import 'package:app/src/provider/change_language.dart';
import 'package:app/src/utils/app_theme.dart';
import 'package:app/welcom_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedpref;

String url = 'http://192.168.1.2/insghts/';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAuvBiWDYVWZeR6jaLiXh3wq1Dma5BduKE",
          authDomain: "apptest-9c105.firebaseapp.com",
          projectId: "apptest-9c105",
          storageBucket: "apptest-9c105.appspot.com",
          messagingSenderId: "786863891446",
          appId: "1:786863891446:web:5a3112e39425805d0e9dd7",
          measurementId: "G-73NX70J1PX"));
  sharedpref = await SharedPreferences.getInstance();

  runApp(
    ChangeNotifierProvider<ChangeLanguage>(
        create: (context) => ChangeLanguage(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChangeLanguage>(context);
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme.getThemeApp,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: Locale(provider.language),
          initialRoute: WelcomeApp.routeName,
          routes: {
            WelcomeApp.routeName: (context) => WelcomeApp(),
            SubscriptionScreen.routeName: (context) => SubscriptionScreen(),
            PaymentScreen.routeName: (context) => PaymentScreen(),
            DataCardScreen.routeName: (context) => DataCardScreen(),
            RegisterScreen.routeName: (context) => RegisterScreen(),
            LoginScreen.routeName: (context) => LoginScreen(),
            ConFirmEmailScreen.routeName: (context) => ConFirmEmailScreen(),
            ConFirmForgetEmialScreen.routeName: (context) =>
                ConFirmForgetEmialScreen(),
            PasswordScreen.routeName: (context) => PasswordScreen(),
            ResetPsswordScreen.routeName: (context) => ResetPsswordScreen(),
            DetailsUserScreen.routeName: (context) => DetailsUserScreen(),
            ForGetPassword.routeName: (context) => ForGetPassword(),
            InformationUser.routeName: (context) => InformationUser(),
            InitHomeScreen.routeName: (context) => InitHomeScreen(),
            NotifivationsScreen.routeName: (context) => NotifivationsScreen(),
            SettingsScreen.routeName: (context) => SettingsScreen(),
            DeleteAccountScreen.routeName: (context) => DeleteAccountScreen(),
            DeleteSureAccountScreen.routeName: (context) =>
                DeleteSureAccountScreen(),
            SecurityScreen.routeName: (context) => SecurityScreen(),
            ChangeUserNameScreen.routeName: (context) => ChangeUserNameScreen(),
            ChangeEmailScreen.routeName: (context) => ChangeEmailScreen(),
            SendConFirmScreen.routeName: (context) => SendConFirmScreen(),
            SetingsSubscribtionScreen.routeName: (context) =>
                SetingsSubscribtionScreen(),
            PaymentwWthCard.routeName: (context) => PaymentwWthCard()
          },
        );
      },
    );
  }
}
