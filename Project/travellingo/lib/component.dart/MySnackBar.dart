import 'package:flutter/material.dart';

class MySnackBar extends SnackBar {
  const MySnackBar({super.key, required super.content});

  Widget build(BuildContext context) {
    return SnackBar(content: content);
  }
}
