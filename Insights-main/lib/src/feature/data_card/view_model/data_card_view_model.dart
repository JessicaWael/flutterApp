import 'package:flutter/material.dart';

class DataCardViewModel extends ChangeNotifier {
  TextEditingController? nameController = TextEditingController();
  TextEditingController? CardNumberController = TextEditingController();
  TextEditingController? cvvController = TextEditingController();
  TextEditingController? expiresController = TextEditingController();
  var formKey = GlobalKey<FormState>();
}
