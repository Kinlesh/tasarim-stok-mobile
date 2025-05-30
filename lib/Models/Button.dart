// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ButtonHelper {
  final BuildContext context;

  ButtonHelper(this.context);

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
