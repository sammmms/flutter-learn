import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
      color: Colors.white,
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
      iconTheme: IconThemeData(color: Colors.black),
      scrolledUnderElevation: 0,
      actionsIconTheme: IconThemeData(color: Colors.black)),
  scaffoldBackgroundColor: const Color.fromARGB(255, 250, 250, 250),
  textTheme: const TextTheme(
    bodySmall: TextStyle(color: Colors.black, fontSize: 10),
    bodyMedium: TextStyle(color: Colors.black, fontSize: 14),
    bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
    titleSmall: TextStyle(color: Colors.black, fontSize: 12),
    titleMedium:
        TextStyle(color: Color.fromARGB(255, 238, 238, 238), fontSize: 16),
    titleLarge: TextStyle(color: Colors.black, fontSize: 18),
    displaySmall: TextStyle(color: Colors.black, fontSize: 10),
    displayMedium: TextStyle(color: Colors.black, fontSize: 14),
    displayLarge: TextStyle(color: Colors.black, fontSize: 16),
    headlineSmall: TextStyle(color: Colors.black, fontSize: 12),
    headlineMedium: TextStyle(color: Colors.black, fontSize: 16),
    headlineLarge: TextStyle(color: Colors.black, fontSize: 18),
    labelSmall: TextStyle(color: Colors.black, fontSize: 10),
    labelMedium: TextStyle(color: Colors.black, fontSize: 14),
    labelLarge: TextStyle(color: Colors.black, fontSize: 16),
  ).apply(
    bodyColor: Colors.black,
    displayColor: Colors.black,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent),
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
      borderSide: BorderSide(color: Colors.redAccent),
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  ),
  elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.redAccent),
          foregroundColor: MaterialStatePropertyAll(Colors.white))),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.redAccent, foregroundColor: Colors.white),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      unselectedLabelStyle: const TextStyle(color: Colors.black),
      unselectedItemColor: Colors.grey.shade400,
      selectedItemColor: Colors.black),
  iconTheme: const IconThemeData(color: Colors.black),
  colorScheme: colorScheme,
  useMaterial3: true,
);

ColorScheme colorScheme = ColorScheme(
  surfaceTint: Colors.white,
  primary: Colors.redAccent,
  primaryContainer: Colors.grey.shade200,
  secondary: Colors.redAccent.shade100,
  secondaryContainer: Colors.grey.shade100,
  surface: Colors.white,
  background: Colors.white,
  error: Colors.red,
  onPrimary: Colors.white,
  onSecondary: Colors.white,
  onSurface: Colors.black,
  onBackground: Colors.black,
  onError: Colors.white,
  brightness: Brightness.light,
  outline: Colors.black,
);
