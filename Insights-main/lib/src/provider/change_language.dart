import 'package:flutter/cupertino.dart';

class ChangeLanguage extends ChangeNotifier {
  String language = 'en';
  void changeLanguage(String newLanguage) {
    if (language == newLanguage) {
      return;
    }
    language = newLanguage;
    notifyListeners();
  }
}
