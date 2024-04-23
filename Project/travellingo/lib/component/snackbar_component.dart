import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

void showMySnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: const Color(0xFFF5D161),
      duration: Duration(milliseconds: 500),
      content: Text(
        text.getString(context),
        style: const TextStyle(color: Colors.white),
      )));
}
