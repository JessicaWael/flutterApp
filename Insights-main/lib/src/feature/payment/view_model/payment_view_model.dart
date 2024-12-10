import 'package:app/src/feature/account/view/change_language/change_language_screen.dart';
import 'package:flutter/material.dart';

class PaymentViewModel extends ChangeNotifier {
  String visa = 'visa';
  String masterCard = 'masterCard';
  String payPal = 'payPal';
  String? selectRadio = 'visa';
}
