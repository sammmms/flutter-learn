import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:m02_praktek/providers/provider.dart';
import 'package:m02_praktek/utils/theme_utils.dart';
import 'package:provider/provider.dart';

class ShuffleLoading extends StatelessWidget {
  const ShuffleLoading({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeSelection currentTheme = context.watch<DarkModeProvider>().theme;
    return currentTheme == ThemeSelection.light
        ? Lottie.asset(
            "assets/lottie/light_mode_loading.json",
            width: 100,
            height: 100,
          )
        : Lottie.asset(
            "assets/lottie/dark_mode_loading.json",
            width: 100,
            height: 100,
          );
  }
}
