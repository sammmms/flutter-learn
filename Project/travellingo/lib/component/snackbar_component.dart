import 'package:flutter/material.dart';

void showMySnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: const Color(0xFFF5D161),
      content: Text(
        text,
        style: const TextStyle(color: Colors.white),
      )));
}
