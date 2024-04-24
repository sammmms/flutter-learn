import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
      color: Colors.black,
      titleTextStyle: TextStyle(color: Colors.white),
      iconTheme: IconThemeData(color: Colors.white),
      scrolledUnderElevation: 0,
      actionsIconTheme: IconThemeData(color: Colors.white)),
  textTheme: const TextTheme(
    bodySmall: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
    bodyLarge: TextStyle(color: Colors.white),
    titleSmall: TextStyle(color: Colors.white),
    titleMedium: TextStyle(color: Color.fromARGB(255, 238, 238, 238)),
    titleLarge: TextStyle(color: Colors.white),
    displayLarge: TextStyle(color: Colors.white),
    displayMedium: TextStyle(color: Colors.white),
    displaySmall: TextStyle(color: Colors.white),
    headlineLarge: TextStyle(color: Colors.white),
    headlineMedium: TextStyle(color: Colors.white),
    headlineSmall: TextStyle(color: Colors.white),
    labelSmall: TextStyle(color: Colors.white),
    labelMedium: TextStyle(color: Colors.white),
    labelLarge: TextStyle(color: Colors.white),
  ).apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
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
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    unselectedItemColor: Colors.white,
    unselectedLabelStyle: TextStyle(color: Colors.white),
    selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.purpleAccent, foregroundColor: Colors.white),
  useMaterial3: true,
);
