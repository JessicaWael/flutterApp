// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  String get Next {
    return Intl.message(
      'Next',
      name: 'Next',
      desc: '',
      args: [],
    );
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `GET STARTED`
  String get GET_STARTED {
    return Intl.message(
      'GET STARTED',
      name: 'GET_STARTED',
      desc: '',
      args: [],
    );
  }

  /// `GO PREMIUM`
  String get GO_PREMIUM {
    return Intl.message(
      'GO PREMIUM',
      name: 'GO_PREMIUM',
      desc: '',
      args: [],
    );
  }

  /// `WEEKLY`
  String get WEEKLY {
    return Intl.message(
      'WEEKLY',
      name: 'WEEKLY',
      desc: '',
      args: [],
    );
  }

  /// `WEEK`
  String get WEEK {
    return Intl.message(
      'WEEK',
      name: 'WEEK',
      desc: '',
      args: [],
    );
  }

  /// `PAY WEEKLY CANCEL ANY TIME`
  String get PAY_WEEKLY_CANCEL_ANY_TIME {
    return Intl.message(
      'PAY WEEKLY CANCEL ANY TIME',
      name: 'PAY_WEEKLY_CANCEL_ANY_TIME',
      desc: '',
      args: [],
    );
  }

  /// `MONTHLY`
  String get MONTHLY {
    return Intl.message(
      'MONTHLY',
      name: 'MONTHLY',
      desc: '',
      args: [],
    );
  }

  /// `MONTH`
  String get MONTH {
    return Intl.message(
      'MONTH',
      name: 'MONTH',
      desc: '',
      args: [],
    );
  }

  /// `PAY MONTHLY CANCEL ANY TIME`
  String get PAY_MONTHLY_CANCEL_ANY_TIME {
    return Intl.message(
      'PAY MONTHLY CANCEL ANY TIME',
      name: 'PAY_MONTHLY_CANCEL_ANY_TIME',
      desc: '',
      args: [],
    );
  }

  /// `FREE TRAIL`
  String get FREE_TRAIL {
    return Intl.message(
      'FREE TRAIL',
      name: 'FREE_TRAIL',
      desc: '',
      args: [],
    );
  }

  /// `STAT FREE TRAIL FOR 3 MONTHS`
  String get STAT_FREE_TRAIL_FOR_3_MONTHS {
    return Intl.message(
      'STAT FREE TRAIL FOR 3 MONTHS',
      name: 'STAT_FREE_TRAIL_FOR_3_MONTHS',
      desc: '',
      args: [],
    );
  }

  /// `CONTINUE`
  String get CONTINUE {
    return Intl.message(
      'CONTINUE',
      name: 'CONTINUE',
      desc: '',
      args: [],
    );
  }

  /// `CANCEL`
  String get CANCEL {
    return Intl.message(
      'CANCEL',
      name: 'CANCEL',
      desc: '',
      args: [],
    );
  }

  /// `Try again in`
  String get Try_again_in {
    return Intl.message(
      'Try again in',
      name: 'Try_again_in',
      desc: '',
      args: [],
    );
  }

  /// `enter name`
  String get enter_name {
    return Intl.message(
      'enter name',
      name: 'enter_name',
      desc: '',
      args: [],
    );
  }

  /// `enter card number`
  String get enter_card_number {
    return Intl.message(
      'enter card number',
      name: 'enter_card_number',
      desc: '',
      args: [],
    );
  }

  /// `enter valid number`
  String get enter_valid_number {
    return Intl.message(
      'enter valid number',
      name: 'enter_valid_number',
      desc: '',
      args: [],
    );
  }

  /// `SUBSCRIBE`
  String get SUBSCRIBE {
    return Intl.message(
      'SUBSCRIBE',
      name: 'SUBSCRIBE',
      desc: '',
      args: [],
    );
  }

  /// `enter cvv`
  String get enter_CVV {
    return Intl.message(
      'enter cvv',
      name: 'enter_CVV',
      desc: '',
      args: [],
    );
  }

  /// `enter valid cvv`
  String get enter_valid_cvv {
    return Intl.message(
      'enter valid cvv',
      name: 'enter_valid_cvv',
      desc: '',
      args: [],
    );
  }

  /// `enter expires date`
  String get enter_expires_date {
    return Intl.message(
      'enter expires date',
      name: 'enter_expires_date',
      desc: '',
      args: [],
    );
  }

  /// `enter emial`
  String get enter_emial {
    return Intl.message(
      'enter emial',
      name: 'enter_emial',
      desc: '',
      args: [],
    );
  }

  /// `enter your password`
  String get enter_your_password {
    return Intl.message(
      'enter your password',
      name: 'enter_your_password',
      desc: '',
      args: [],
    );
  }

  /// `PAYMENT METHOD`
  String get PAYMENT_METHOD {
    return Intl.message(
      'PAYMENT METHOD',
      name: 'PAYMENT_METHOD',
      desc: '',
      args: [],
    );
  }

  /// `name`
  String get name {
    return Intl.message(
      'name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `card number`
  String get card_number {
    return Intl.message(
      'card number',
      name: 'card_number',
      desc: '',
      args: [],
    );
  }

  /// `CVV`
  String get CVV {
    return Intl.message(
      'CVV',
      name: 'CVV',
      desc: '',
      args: [],
    );
  }

  /// `expires`
  String get expires {
    return Intl.message(
      'expires',
      name: 'expires',
      desc: '',
      args: [],
    );
  }

  /// `Compelete Payment`
  String get compelete_payment {
    return Intl.message(
      'Compelete Payment',
      name: 'compelete_payment',
      desc: '',
      args: [],
    );
  }

  /// `LOGIN`
  String get LOGIN {
    return Intl.message(
      'LOGIN',
      name: 'LOGIN',
      desc: '',
      args: [],
    );
  }

  /// `EMAIL`
  String get EMAIL {
    return Intl.message(
      'EMAIL',
      name: 'EMAIL',
      desc: '',
      args: [],
    );
  }

  /// `ADD YOUR EMAIL`
  String get ADD_YOUR_EMAIL {
    return Intl.message(
      'ADD YOUR EMAIL',
      name: 'ADD_YOUR_EMAIL',
      desc: '',
      args: [],
    );
  }

  /// `PASSWORD`
  String get PASSWORD {
    return Intl.message(
      'PASSWORD',
      name: 'PASSWORD',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get or {
    return Intl.message(
      'or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Continue with google account`
  String get continue_with_Google_account {
    return Intl.message(
      'Continue with google account',
      name: 'continue_with_Google_account',
      desc: '',
      args: [],
    );
  }

  /// `Forget password?`
  String get forget_password {
    return Intl.message(
      'Forget password?',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `You don'T have an account?`
  String get YOU_DONT_HAVE_AN_ACCOUNT {
    return Intl.message(
      'You don\' have an account?',
      name: 'YOU_DONT_HAVE_AN_ACCOUNT',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get SIGN_UP {
    return Intl.message(
      'Sign up',
      name: 'SIGN_UP',
      desc: '',
      args: [],
    );
  }

  /// `RESET YOUR PASSWORD`
  String get RESET_YOUR_PASSWORD {
    return Intl.message(
      'RESET YOUR PASSWORD',
      name: 'RESET_YOUR_PASSWORD',
      desc: '',
      args: [],
    );
  }

  /// `ENTER THE CODE WE SENT TO YOU`
  String get ENTER_THE_CODE_WE_SENT_TO_YOU {
    return Intl.message(
      'ENTER THE CODE WE SENT TO YOU',
      name: 'ENTER_THE_CODE_WE_SENT_TO_YOU',
      desc: '',
      args: [],
    );
  }

  /// `WE SENT 6 DIGIT CODE TO YOUR EMAIL ADDRESS`
  String get WE_SENT_6_DIGIT_CODE_TO_YOUR_EMAIL_ADDRESS {
    return Intl.message(
      'WE SENT 6 DIGIT CODE TO YOUR EMAIL ADDRESS',
      name: 'WE_SENT_6_DIGIT_CODE_TO_YOUR_EMAIL_ADDRESS',
      desc: '',
      args: [],
    );
  }

  /// `ENTER THAT CODE TO RESET YOUR PASSWORD`
  String get ENTER_THAT_CODE_TO_RESET_YOUR_PASSWORD {
    return Intl.message(
      'ENTER THAT CODE TO RESET YOUR PASSWORD',
      name: 'ENTER_THAT_CODE_TO_RESET_YOUR_PASSWORD',
      desc: '',
      args: [],
    );
  }

  /// `SEND EMAIL AGINE`
  String get SEND_EMAIL_AGINE {
    return Intl.message(
      'SEND EMAIL AGINE',
      name: 'SEND_EMAIL_AGINE',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get Confirm {
    return Intl.message(
      'Confirm',
      name: 'Confirm',
      desc: '',
      args: [],
    );
  }

  /// `CREATE NEW PASSWORD`
  String get CREATE_NEW_PASSWORD {
    return Intl.message(
      'CREATE NEW PASSWORD',
      name: 'CREATE_NEW_PASSWORD',
      desc: '',
      args: [],
    );
  }

  /// `CONFIRM THE PASSWORD`
  String get CONFIRM_THE_PASSWORD {
    return Intl.message(
      'CONFIRM THE PASSWORD',
      name: 'CONFIRM_THE_PASSWORD',
      desc: '',
      args: [],
    );
  }

  /// `please enter password`
  String get please_enter_password {
    return Intl.message(
      'please enter password',
      name: 'please_enter_password',
      desc: '',
      args: [],
    );
  }

  /// `password not match`
  String get password_not_match {
    return Intl.message(
      'password not match',
      name: 'password_not_match',
      desc: '',
      args: [],
    );
  }

  /// `ALREADY HAVE AN ACCOUNT YET`
  String get ALREADY_HAVE_AN_ACCOUNT_YET {
    return Intl.message(
      'ALREADY HAVE AN ACCOUNT YET',
      name: 'ALREADY_HAVE_AN_ACCOUNT_YET',
      desc: '',
      args: [],
    );
  }

  /// `CREATE YOUR PASSWORD`
  String get CREATE_YOUR_PASSWORD {
    return Intl.message(
      'CREATE YOUR PASSWORD',
      name: 'CREATE_YOUR_PASSWORD',
      desc: '',
      args: [],
    );
  }

  /// `enter password`
  String get enter_password {
    return Intl.message(
      'enter password',
      name: 'enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Hey there whats your name`
  String get hey_there_whats_your_name {
    return Intl.message(
      'Hey there whats your name',
      name: 'hey_there_whats_your_name',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get first_name {
    return Intl.message(
      'First name',
      name: 'first_name',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get last_name {
    return Intl.message(
      'Last name',
      name: 'last_name',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get user_name {
    return Intl.message(
      'User name',
      name: 'user_name',
      desc: '',
      args: [],
    );
  }

  /// `enter first name`
  String get enter_first_name {
    return Intl.message(
      'enter first name',
      name: 'enter_first_name',
      desc: '',
      args: [],
    );
  }

  /// `enter last name`
  String get enter_last_name {
    return Intl.message(
      'enter last name',
      name: 'enter_last_name',
      desc: '',
      args: [],
    );
  }

  /// `enter user name`
  String get enter_user_name {
    return Intl.message(
      'enter user name',
      name: 'enter_user_name',
      desc: '',
      args: [],
    );
  }

  /// `Where are you from nationality`
  String get where_are_you_from_nationality {
    return Intl.message(
      'Where are you from nationality',
      name: 'where_are_you_from_nationality',
      desc: '',
      args: [],
    );
  }

  /// `Birth day date`
  String get birthday_date {
    return Intl.message(
      'Birth day date',
      name: 'birthday_date',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phone_number {
    return Intl.message(
      'Phone number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `National ID`
  String get national_ID {
    return Intl.message(
      'National ID',
      name: 'national_ID',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your nationality`
  String get please_enter_your_nationality {
    return Intl.message(
      'Please enter your nationality',
      name: 'please_enter_your_nationality',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your birthday date`
  String get please_enter_your_birthday_date {
    return Intl.message(
      'Please enter your birthday date',
      name: 'please_enter_your_birthday_date',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get please_enter_your_phone_number {
    return Intl.message(
      'Please enter your phone number',
      name: 'please_enter_your_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your national ID`
  String get please_enter_your_national_ID {
    return Intl.message(
      'Please enter your national ID',
      name: 'please_enter_your_national_ID',
      desc: '',
      args: [],
    );
  }

  /// `Hi`
  String get Hi {
    return Intl.message(
      'Hi',
      name: 'Hi',
      desc: '',
      args: [],
    );
  }

  /// `The most profitable stocks`
  String get The_most_profitable_stocks {
    return Intl.message(
      'The most profitable stocks',
      name: 'The_most_profitable_stocks',
      desc: '',
      args: [],
    );
  }

  /// `Best selling stocks`
  String get Best_selling_stocks {
    return Intl.message(
      'Best selling stocks',
      name: 'Best_selling_stocks',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Portfolio`
  String get Prediction {
    return Intl.message(
      'Prediction',
      name: 'Prediction',
      desc: '',
      args: [],
    );
  }

  /// `Feed`
  String get Feed {
    return Intl.message(
      'Feed',
      name: 'Feed',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get Account {
    return Intl.message(
      'Account',
      name: 'Account',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get Notifications {
    return Intl.message(
      'Notifications',
      name: 'Notifications',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get Setting {
    return Intl.message(
      'Setting',
      name: 'Setting',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get Change_Language {
    return Intl.message(
      'Change Language',
      name: 'Change_Language',
      desc: '',
      args: [],
    );
  }

  /// `Security`
  String get Security {
    return Intl.message(
      'Security',
      name: 'Security',
      desc: '',
      args: [],
    );
  }

  /// `Subscription`
  String get Subscription {
    return Intl.message(
      'Subscription',
      name: 'Subscription',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get Log_Out {
    return Intl.message(
      'Log Out',
      name: 'Log_Out',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get Delete_Account {
    return Intl.message(
      'Delete Account',
      name: 'Delete_Account',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get Are_you_sure_you_want_to_log_out {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'Are_you_sure_you_want_to_log_out',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message(
      'Cancel',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  /// `Can you tell us why you want to leave?`
  String get Can_you_tell_us_why_you_want_to_leave {
    return Intl.message(
      'Can you tell us why you want to leave?',
      name: 'Can_you_tell_us_why_you_want_to_leave',
      desc: '',
      args: [],
    );
  }

  /// `Transitioning to a different investment platform`
  String get Transitioning_to_a_different_investment_platform {
    return Intl.message(
      'Transitioning to a different investment platform',
      name: 'Transitioning_to_a_different_investment_platform',
      desc: '',
      args: [],
    );
  }

  /// `Dissatisfaction with application performane (speed,bugs,etc)`
  String get Dissatisfaction_with_application_performane {
    return Intl.message(
      'Dissatisfaction with application performane (speed,bugs,etc)',
      name: 'Dissatisfaction_with_application_performane',
      desc: '',
      args: [],
    );
  }

  /// `Limited usage or just experimenting with the app`
  String get Limited_usage_or_just_experimenting_with_the_app {
    return Intl.message(
      'Limited usage or just experimenting with the app',
      name: 'Limited_usage_or_just_experimenting_with_the_app',
      desc: '',
      args: [],
    );
  }

  /// `Difficulty finding the desired investment product`
  String get Difficulty_finding_the_desired_investmentproduct {
    return Intl.message(
      'Difficulty finding the desired investment product',
      name: 'Difficulty_finding_the_desired_investmentproduct',
      desc: '',
      args: [],
    );
  }

  /// `Unhappy with existing features on the application`
  String get Unhappy_with_existing_features_on_the_application {
    return Intl.message(
      'Unhappy with existing features on the application',
      name: 'Unhappy_with_existing_features_on_the_application',
      desc: '',
      args: [],
    );
  }

  /// `Personal reasons`
  String get Personal_reasons {
    return Intl.message(
      'Personal reasons',
      name: 'Personal_reasons',
      desc: '',
      args: [],
    );
  }

  /// `Note That`
  String get Note_That {
    return Intl.message(
      'Note That',
      name: 'Note_That',
      desc: '',
      args: [],
    );
  }

  /// `Account Reactivation is possible within 30 Days`
  String get Account_Reactivation_is_possible_within_30_Days {
    return Intl.message(
      'Account Reactivation is possible within 30 Days',
      name: 'Account_Reactivation_is_possible_within_30_Days',
      desc: '',
      args: [],
    );
  }

  /// `Keep account`
  String get Keep_account {
    return Intl.message(
      'Keep account',
      name: 'Keep_account',
      desc: '',
      args: [],
    );
  }

  /// `Change Username`
  String get Change_Username {
    return Intl.message(
      'Change Username',
      name: 'Change_Username',
      desc: '',
      args: [],
    );
  }

  /// `Change Email`
  String get Change_Email {
    return Intl.message(
      'Change Email',
      name: 'Change_Email',
      desc: '',
      args: [],
    );
  }

  /// `Current Username`
  String get Current_Username {
    return Intl.message(
      'Current Username',
      name: 'Current_Username',
      desc: '',
      args: [],
    );
  }

  /// `New Username`
  String get New_Username {
    return Intl.message(
      'New Username',
      name: 'New_Username',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get Submit {
    return Intl.message(
      'Submit',
      name: 'Submit',
      desc: '',
      args: [],
    );
  }

  /// `Current Email`
  String get Current_Email {
    return Intl.message(
      'Current Email',
      name: 'Current_Email',
      desc: '',
      args: [],
    );
  }

  /// `New Email`
  String get New_Email {
    return Intl.message(
      'New Email',
      name: 'New_Email',
      desc: '',
      args: [],
    );
  }

  /// `after changing your email , you wii be logged out and can only login with the new emailand any future communication will be sent to your new email`
  String
      get after_changing_you_email_and_any_futur_communication_will_be_sent_to_your_new_email {
    return Intl.message(
      'after changing your email , you wii be logged out and can only login with the new emailand any future communication will be sent to your new email',
      name:
          'after_changing_you_email_and_any_futur_communication_will_be_sent_to_your_new_email',
      desc: '',
      args: [],
    );
  }

  /// `. in case you entered a new email that links to an unverified account ,  the other account wii be deleted`
  String get in_case_ou_entered_new_email {
    return Intl.message(
      '. in case you entered a new email that links to an unverified account ,  the other account wii be deleted',
      name: 'in_case_ou_entered_new_email',
      desc: '',
      args: [],
    );
  }

  /// `Send Verification Code`
  String get Send_Verification_Code {
    return Intl.message(
      'Send Verification Code',
      name: 'Send_Verification_Code',
      desc: '',
      args: [],
    );
  }

  /// `Your Email Changed Successfully`
  String get Your_Email_Changed_Successfully {
    return Intl.message(
      'Your Email Changed Successfully',
      name: 'Your_Email_Changed_Successfully',
      desc: '',
      args: [],
    );
  }

  /// `NO`
  String get NO {
    return Intl.message(
      'NO',
      name: 'NO',
      desc: '',
      args: [],
    );
  }

  /// `YES`
  String get YES {
    return Intl.message(
      'YES',
      name: 'YES',
      desc: '',
      args: [],
    );
  }

  /// `Edit Subscription`
  String get Edit_Subscription {
    return Intl.message(
      'Edit Subscription',
      name: 'Edit_Subscription',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled subscription`
  String get Cancelled_subscription {
    return Intl.message(
      'Cancelled subscription',
      name: 'Cancelled_subscription',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to cancel your subscription?`
  String get Are_you_sure_you_want_to_cancel_your_subscription {
    return Intl.message(
      'Are you sure you want to cancel your subscription?',
      name: 'Are_you_sure_you_want_to_cancel_your_subscription',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade To Premuim`
  String get Upgrade_To_Premuim {
    return Intl.message(
      'Upgrade To Premuim',
      name: 'Upgrade_To_Premuim',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe Month`
  String get Subscribe_Month {
    return Intl.message(
      'Subscribe Month',
      name: 'Subscribe_Month',
      desc: '',
      args: [],
    );
  }

  /// `THE SUBSCRIBTION RENEWS AUTOMATICALLY TILL YOU TURN IT OFF. YOU CAN CANCEL YOUR SUBSCRIBTION OR TRIAL ANY TIME BY CANCELLING YOUR SUBSCRIPTION  THROUGH YOUR ACCOUNT SETTINGS, OR IT WILL AUTOMATICALLY RENEW.THIS MUST BE DONE 24 HOURS BEFORE THE END OF THE TRAIL OR ANY SUBSCRIPTION PERIOD TO AVOID BEING CHARGED.`
  String get THE_SUBSCRIBTION_RENEWS {
    return Intl.message(
      'THE SUBSCRIBTION RENEWS AUTOMATICALLY TILL YOU TURN IT OFF. YOU CAN CANCEL YOUR SUBSCRIBTION OR TRIAL ANY TIME BY CANCELLING YOUR SUBSCRIPTION  THROUGH YOUR ACCOUNT SETTINGS, OR IT WILL AUTOMATICALLY RENEW.THIS MUST BE DONE 24 HOURS BEFORE THE END OF THE TRAIL OR ANY SUBSCRIPTION PERIOD TO AVOID BEING CHARGED.',
      name: 'THE_SUBSCRIBTION_RENEWS',
      desc: '',
      args: [],
    );
  }

  /// `my portfolio`
  String get my_portfolio {
    return Intl.message(
      'my portfolio',
      name: 'my_portfolio',
      desc: '',
      args: [],
    );
  }

  /// `my investment`
  String get my_investment {
    return Intl.message(
      'my investment',
      name: 'my_investment',
      desc: '',
      args: [],
    );
  }

  /// `your stocks`
  String get your_stocks {
    return Intl.message(
      'your stocks',
      name: 'your_stocks',
      desc: '',
      args: [],
    );
  }

  /// `recent activities`
  String get recent_activities {
    return Intl.message(
      'recent activities',
      name: 'recent_activities',
      desc: '',
      args: [],
    );
  }

  /// `feed`
  String get feed {
    return Intl.message(
      'feed',
      name: 'feed',
      desc: '',
      args: [],
    );
  }

  /// `Markets`
  String get Markets {
    return Intl.message(
      'Markets',
      name: 'Markets',
      desc: '',
      args: [],
    );
  }

  /// `View all`
  String get View_all {
    return Intl.message(
      'View all',
      name: 'View_all',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '24K_Gold' key

  /// `Add up to four different markets`
  String get Add_up_to_four_different_markets {
    return Intl.message(
      'Add up to four different markets',
      name: 'Add_up_to_four_different_markets',
      desc: '',
      args: [],
    );
  }

  /// `to your daily feed`
  String get to_your_daily_feed {
    return Intl.message(
      'to your daily feed',
      name: 'to_your_daily_feed',
      desc: '',
      args: [],
    );
  }

  /// `Hide`
  String get Hide {
    return Intl.message(
      'Hide',
      name: 'Hide',
      desc: '',
      args: [],
    );
  }

  /// `Show`
  String get Show {
    return Intl.message(
      'Show',
      name: 'Show',
      desc: '',
      args: [],
    );
  }

  /// `Constituente`
  String get Constituente {
    return Intl.message(
      'Constituente',
      name: 'Constituente',
      desc: '',
      args: [],
    );
  }

  /// `Commercial international bank`
  String get Commercial_international_bank {
    return Intl.message(
      'Commercial international bank',
      name: 'Commercial_international_bank',
      desc: '',
      args: [],
    );
  }

  /// `Buy`
  String get Buy {
    return Intl.message(
      'Buy',
      name: 'Buy',
      desc: '',
      args: [],
    );
  }

  String get Upload_Image {
    return Intl.message(
      'Upload Image',
      name: 'Upload_Image',
      desc: '',
      args: [],
    );
  }

  String get banks {
    return Intl.message(
      'Banks',
      name: 'banks',
      desc: '',
      args: [],
    );
  }

  String get Industrial_services_products_and_cars {
    return Intl.message(
      'Industrial services, products and cars',
      name: 'Industrial_services_products_and_car',
      desc: '',
      args: [],
    );
  }

  String get real_estate {
    return Intl.message(
      'Real estate',
      name: 'real_estate',
      desc: '',
      args: [],
    );
  }

  String get communications_media_and_information_technology {
    return Intl.message(
      'Communications, media and information technology',
      name: 'communications_media_and_information_technology',
      desc: '',
      args: [],
    );
  }

  String get food_drinks_and_tobacco {
    return Intl.message(
      'Food, drinks and tobacco',
      name: 'food_drinks_and_tobacco',
      desc: '',
      args: [],
    );
  }

  String get transportation_and_shipping_services {
    return Intl.message(
      'Transportation and shipping services',
      name: 'transportation_and_shipping_services',
      desc: '',
      args: [],
    );
  }

  String get non_banking_financial_services {
    return Intl.message(
      'Non-banking financial services',
      name: 'non_banking_financial_services',
      desc: '',
      args: [],
    );
  }

  String get engineering_contracting_and_construction {
    return Intl.message(
      'Engineering contracting and construction',
      name: 'engineering_contracting_and_construction',
      desc: '',
      args: [],
    );
  }

  String get textiles_and_durable_goods {
    return Intl.message(
      'Textiles and durable goods',
      name: 'textiles_and_durable_goods',
      desc: '',
      args: [],
    );
  }

  String get Health_care_and_medicines {
    return Intl.message(
      'Health care and medicines',
      name: 'Health_care_and_medicines',
      desc: '',
      args: [],
    );
  }

  String get educational_services {
    return Intl.message(
      'Educational services',
      name: 'educational_services',
      desc: '',
      args: [],
    );
  }

  String get basic_resources {
    return Intl.message(
      'Basic resources',
      name: 'basic_resources',
      desc: '',
      args: [],
    );
  }

  String get sectors {
    return Intl.message(
      'Sectors',
      name: 'sectors',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
