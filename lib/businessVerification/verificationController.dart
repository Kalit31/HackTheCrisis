import 'package:flutter/material.dart';

class VerificationController with ChangeNotifier {
  bool isProcessing = false;

  VerificationController();

  Future<void> verify() async {
    isProcessing = true;
    notifyListeners();
  }
}
