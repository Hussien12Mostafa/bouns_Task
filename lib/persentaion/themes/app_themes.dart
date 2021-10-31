// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData darkMode = ThemeData();
  static final ThemeData lightTheme = ThemeData(
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.blue,
      /* labelStyle: TextStyle(fontSize: 25) */
      unselectedLabelColor: Colors.amber,
      unselectedLabelStyle: TextStyle(fontSize: 25),
    ),
    primarySwatch: Colors.orange,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: //Color(0xff4285F4),
          const Color.fromRGBO(66, 133, 244, 1),
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.amber),
      toolbarTextStyle: const TextStyle(
        color: Colors.amber,
      ),
      backgroundColor: Colors.black,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.amber,
      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(fontSize: 14),
      bodyText2: TextStyle(
        fontSize: 18,
      ),
      headline6: TextStyle(
        fontSize: 28,
      ),
    ),
  );
}
