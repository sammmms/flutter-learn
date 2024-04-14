import 'package:flutter/material.dart';

void showMySnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.yellow,
      content: Text(
        text,
        style: const TextStyle(color: Colors.white),
      )));
}
