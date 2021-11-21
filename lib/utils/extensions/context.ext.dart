import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  void displaySnackbar(String text) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(text)));
  }
}
