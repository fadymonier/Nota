//light theme
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        background: Colors.grey.shade300,
        primary: Colors.grey.shade200,
        secondary: Colors.grey.shade400,
        inversePrimary: Colors.grey.shade800,
        error: Colors.red,
        secondaryFixed: Colors.blue));

//dark theme
ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        background: const Color.fromARGB(255, 24, 24, 24),
        primary: const Color.fromARGB(255, 34, 34, 34),
        secondary: const Color.fromARGB(255, 49, 49, 49),
        inversePrimary: Colors.grey.shade300,
        error: Colors.red,
        secondaryFixed: Colors.blue));
