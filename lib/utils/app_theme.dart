import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      iconTheme: const IconThemeData(size: 20, color: Colors.black),
      tabBarTheme: const TabBarTheme(
        labelColor: Colors.blue,
        unselectedLabelColor: Colors.grey,
      ),
    );
  }
}