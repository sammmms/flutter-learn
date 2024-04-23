import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: "Poppins",
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
        fontFamily: "Poppins",
        fontSize: 18,
        letterSpacing: 1.1,
        fontWeight: FontWeight.bold),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFFF6F8FB),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.transparent)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.transparent)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.redAccent)),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.redAccent)),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.transparent)),
  ),
  outlinedButtonTheme: const OutlinedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Color(0xFFF5D161)),
          side: MaterialStatePropertyAll(BorderSide(color: Colors.transparent)),
          foregroundColor: MaterialStatePropertyAll(Colors.white))),
  colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF5D161)),
  iconTheme: const IconThemeData(color: Color(0xFFF5D161)),
  primaryIconTheme: const IconThemeData(color: Color(0xFFF5D161)),
  useMaterial3: true,
);
