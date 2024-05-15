import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
      color: Colors.white,
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
      iconTheme: IconThemeData(color: Colors.black),
      scrolledUnderElevation: 0,
      actionsIconTheme: IconThemeData(color: Colors.black)),
  scaffoldBackgroundColor: Color.fromARGB(255, 250, 250, 250),
  textTheme: const TextTheme(
    bodySmall: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black),
    bodyLarge: TextStyle(color: Colors.black),
    titleSmall: TextStyle(color: Colors.black),
    titleMedium: TextStyle(color: Color.fromARGB(255, 238, 238, 238)),
    titleLarge: TextStyle(color: Colors.black),
    displayLarge: TextStyle(color: Colors.black),
    displayMedium: TextStyle(color: Colors.black),
    displaySmall: TextStyle(color: Colors.black),
    headlineLarge: TextStyle(color: Colors.black),
    headlineMedium: TextStyle(color: Colors.black),
    headlineSmall: TextStyle(color: Colors.black),
    labelSmall: TextStyle(color: Colors.black),
    labelMedium: TextStyle(color: Colors.black),
    labelLarge: TextStyle(color: Colors.black),
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
      unselectedLabelStyle: TextStyle(color: Colors.black)),
  iconTheme: const IconThemeData(color: Colors.black),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
  useMaterial3: true,
);