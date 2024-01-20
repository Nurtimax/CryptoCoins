import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(223, 28, 27, 27),
  primarySwatch: Colors.yellow,
  dividerColor: Colors.white24,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    elevation: 0,
    backgroundColor: Color.fromARGB(223, 28, 27, 27),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
  ),
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
      labelSmall: TextStyle(
        color: Color.fromARGB(255, 213, 213, 210),
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
      headlineMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 24,
      )),
);
