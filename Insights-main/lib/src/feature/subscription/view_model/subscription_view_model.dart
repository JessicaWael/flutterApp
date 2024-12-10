import 'package:flutter/widgets.dart';

class SubscriptionViewModel extends ChangeNotifier {
  int weekly = 1;
  int monthly = 2;
  int freeTrail = 3;
  int? selectedRadio = 1;
  void ChangeValueRadio(int? value) {
    if (selectedRadio == value) {
      return;
    }
    selectedRadio = value;

    print(selectedRadio);
    notifyListeners();
  }
}
