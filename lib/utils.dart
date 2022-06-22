import 'package:flutter/material.dart';

class Utils {
  late String text;
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
  showSnackBar(BuildContext context, String text) {
    return ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        content:Text(text),
        duration: Duration(seconds: 2),
      ),
    );
  }
}