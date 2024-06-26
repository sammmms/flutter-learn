import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
      color: Color.fromRGBO(0, 0, 0, 1),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      iconTheme: IconThemeData(color: Colors.white),
      scrolledUnderElevation: 0,
      actionsIconTheme: IconThemeData(color: Colors.white)),
  textTheme: const TextTheme(
    bodySmall: TextStyle(color: Colors.white, fontSize: 10),
    bodyMedium: TextStyle(color: Colors.white, fontSize: 14),
    bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
    titleSmall: TextStyle(color: Colors.white, fontSize: 12),
    titleMedium:
        TextStyle(color: Color.fromARGB(255, 238, 238, 238), fontSize: 16),
    titleLarge: TextStyle(color: Colors.white, fontSize: 18),
    displaySmall: TextStyle(color: Colors.white, fontSize: 10),
    displayMedium: TextStyle(color: Colors.white, fontSize: 14),
    displayLarge: TextStyle(color: Colors.white, fontSize: 16),
    headlineSmall: TextStyle(color: Colors.white, fontSize: 12),
    headlineMedium: TextStyle(color: Colors.white, fontSize: 16),
    headlineLarge: TextStyle(color: Colors.white, fontSize: 18),
    labelSmall: TextStyle(color: Colors.white, fontSize: 10),
    labelMedium: TextStyle(color: Colors.white, fontSize: 14),
    labelLarge: TextStyle(color: Colors.white, fontSize: 16),
  ).apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Colors.grey.shade700,
    contentTextStyle: const TextStyle(color: Colors.white),
    actionTextColor: Colors.white,
  ),
  listTileTheme: const ListTileThemeData(
      selectedColor: Colors.white38, textColor: Colors.white),
  scaffoldBackgroundColor: const Color.fromARGB(255, 56, 56, 56),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.white),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.purpleAccent),
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(5))),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.purpleAccent),
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  ),
  elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.purpleAccent),
          foregroundColor: MaterialStatePropertyAll(Colors.white))),
  iconTheme: const IconThemeData(color: Colors.white),
  colorScheme: colorScheme,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      unselectedItemColor: Colors.white,
      unselectedLabelStyle: TextStyle(color: Colors.white),
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      selectedItemColor: Colors.white),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.purpleAccent, foregroundColor: Colors.white),
  useMaterial3: true,
);

ColorScheme colorScheme = ColorScheme(
  surfaceTint: Colors.transparent,
  primary: Colors.purpleAccent,
  primaryContainer: Colors.grey.shade500,
  secondary: Colors.purpleAccent.shade100,
  secondaryContainer: Colors.grey.shade300,
  surface: Colors.black,
  background: Colors.grey.shade800,
  error: Colors.red,
  onPrimary: Colors.white,
  onSecondary: Colors.white,
  onSurface: Colors.white,
  onBackground: Colors.white,
  onError: Colors.white,
  brightness: Brightness.dark,
  outline: Colors.white,
);
