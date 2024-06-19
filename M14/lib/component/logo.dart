import 'package:flutter/material.dart';
import 'package:m02_praktek/providers/provider.dart';
import 'package:m02_praktek/utils/theme_utils.dart';
import 'package:provider/provider.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logo.png',
      color: context.watch<DarkModeProvider>().theme == ThemeSelection.light
          ? Colors.redAccent
          : Colors.purpleAccent,
      width: 200,
    );
  }
}
