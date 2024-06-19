import 'package:flutter/material.dart';
import 'package:m02_praktek/providers/provider.dart';
import 'package:m02_praktek/utils/theme_utils.dart';
import 'package:provider/provider.dart';

class DarkModeSwitch extends StatelessWidget {
  const DarkModeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeSelection currentTheme = context.watch<DarkModeProvider>().theme;
    return SwitchListTile(
        title: const Text("Dark Mode"),
        value: currentTheme == ThemeSelection.light,
        thumbIcon: MaterialStatePropertyAll(
            context.watch<DarkModeProvider>().theme == ThemeSelection.light
                ? Icon(
                    Icons.sunny,
                    color: Theme.of(context).colorScheme.outline,
                  )
                : const Icon(Icons.dark_mode)),
        onChanged: (value) {
          context.read<DarkModeProvider>().changeTheme();
        });
  }
}
